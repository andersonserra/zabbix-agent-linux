#!/bin/bash
sistema=`hostnamectl | grep "Operating System" | cut -d ':' -f2 | awk '{print $1}'`

case $sistema in

Debian)
	debian()
	;;
CentOS)
	centos()
	;;
Ubuntu)
	ubuntu()
	;;
esac

centos() {
yum update -y
yum -y install vim screen nmap net-tools traceroute tcpdump htop bind-utils open-vm-tools
yum remove postfix -y
systemctl stop firewalld
systemctl disable firewalld 
sed -i s/SELINUX=enforcing/SELINUX=disabled/ /etc/selinux/config 
setenforce 0 
rpm -Uvh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm 
yum update -y 
yum install zabbix-agent -y
echo "" > /etc/zabbix/zabbix_agentd.conf
echo "
PidFile=/var/run/zabbix/zabbix_agentd.pid
LogFile=/var/log/zabbix/zabbix_agentd.log
LogFileSize=0
DebugLevel=3
Server=10.22.8.201,10.22.8.202,10.22.8.205,10.22.8.206
StartAgents=5
Hostname=$HOSTNAME
Timeout=15
Include=/etc/zabbix/zabbix_agentd.d/*.conf
" > /etc/zabbix/zabbix_agentd.conf
systemctl enable zabbix-agent
systemctl restart zabbix-agent

}

#################################################################################

debian() {
#criar usuario zabbix
addgroup --system --quiet zabbix
adduser --quiet --system --disabled-login --ingroup zabbix --home /var/lib/zabbix --no-create-home zabbix

apt-get update -y
apt-get -y wget install vim screen nmap net-tools traceroute tcpdump htop bind-utils open-vm-tools make gcc
wget https://cdn.zabbix.com/zabbix/sources/stable/4.0/zabbix-4.0.22.tar.gz
tar -xf zabbix-4.0.22.tar.gz
cd zabbix-4.0.22
./configure --prefix=/usr/local --enable-agent 
make install 

echo "
#!/bin/sh
#
# Zabbix agent start/stop script.
#
# Copyright (C) 2001-2020 Zabbix SIA

NAME=zabbix_agentd
DAEMON=/usr/local/sbin/${NAME}
DESC="Zabbix agent daemon"
PID=/tmp/$NAME.pid

test -f $DAEMON || exit 0

case "$1" in
  start)
	echo "Starting $DESC: $NAME"
	start-stop-daemon --start --oknodo --pidfile $PID --exec $DAEMON
	;;
  stop)
	echo "Stopping $DESC: $NAME"
	start-stop-daemon --stop --quiet --pidfile $PID --retry=TERM/10/KILL/5 && exit 0
	start-stop-daemon --stop --oknodo --exec $DAEMON --name $NAME --retry=TERM/10/KILL/5
	;;
  restart|force-reload)
	$0 stop
	$0 start
	;;
  *)
	N=/etc/init.d/$NAME
	echo "Usage: $N {start|stop|restart|force-reload}" >&2
	exit 1
	;;
esac

exit 0
" > /etc/init.d/zabbix-agentd

echo "" > /usr/local/etc/zabbix_agentd.conf
echo "
PidFile=/tmp/zabbix_agentd.pid
LogFile=/var/log/zabbix_agentd.log
LogFileSize=0
DebugLevel=3
Server=10.22.8.201,10.22.8.202,10.22.8.205,10.22.8.206
StartAgents=5
Hostname=`echo $HOSTNAME`
Timeout=15
Include=/etc/zabbix/zabbix_agentd.d/*.conf
" > /usr/local/etc/zabbix_agentd.conf

/etc/init.d/zabbix-agentd restart

}
