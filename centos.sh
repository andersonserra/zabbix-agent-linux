##################################################################################################################
function centos_system {
yum update -y
yum -y install vim screen nmap net-tools traceroute tcpdump htop bind-utils open-vm-tools python-requests
yum remove postfix -y
systemctl stop firewalld
systemctl disable firewalld
sed -i s/SELINUX=enforcing/SELINUX=disabled/ /etc/selinux/config
setenforce 0
}


##################################################################################################################
function zabbix_agent_centos6 {
echo "Iniciando instalação para sistema operacional Centos 6"
rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/6/x86_64/zabbix-release-5.0-1.el6.noarch.rpm
yum update -y
yum install zabbix-agent -y
echo "" > /etc/zabbix/zabbix_agentd.conf
echo "
PidFile=/var/run/zabbix/zabbix_agentd.pid
LogFile=/var/log/zabbix/zabbix_agentd.log
LogFileSize=0
DebugLevel=3
Server=10.22.8.201,10.22.8.202,10.22.8.205
StartAgents=5
Hostname=`hostname -f`
Timeout=15
Include=/etc/zabbix/zabbix_agentd.d/*.conf
" > /etc/zabbix/zabbix_agentd.conf
systemctl enable zabbix-agent
chkconfig --level 35 zabbix-agent on
systemctl restart zabbix-agent

}


##################################################################################################################
function zabbix_agent_centos7 {
echo "Iniciando instalação para sistema operacional Centos 7"
rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm
yum clean all
yum install zabbix-agent
echo "" > /etc/zabbix/zabbix_agentd.conf
echo "
PidFile=/var/run/zabbix/zabbix_agentd.pid
LogFile=/var/log/zabbix/zabbix_agentd.log
LogFileSize=0
DebugLevel=3
Server=10.22.8.201,10.22.8.202,10.22.8.205
StartAgents=5
Hostname=`hostname -f`
Timeout=15
Include=/etc/zabbix/zabbix_agentd.d/*.conf
" > /etc/zabbix/zabbix_agentd.conf
systemctl enable zabbix-agent
systemctl restart zabbix-agent
}

##################################################################################################################
function zabbix_agent_centos8 {
echo "Iniciando instalação para sistema operacional Centos 8"
rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/8/x86_64/zabbix-release-5.0-1.el8.noarch.rpm
dnf -y clean all
#Instalando agente zabbix
dnf install -y zabbix-agent
#realizando backup do arquivo de configuração original da instalacao
cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bkp
echo "
PidFile=/var/run/zabbix/zabbix_agentd.pid
LogFile=/var/log/zabbix/zabbix_agentd.log
LogFileSize=0
DebugLevel=0
Server=10.22.8.201,10.22.8.202,10.22.8.205
StartAgents=5
Hostname=`hostname -f`
Timeout=15
Include=/etc/zabbix/zabbix_agentd.d/*.conf
" > /etc/zabbix/zabbix_agentd.conf
systemctl enable zabbix-agent
systemctl restart zabbix-agent
}
