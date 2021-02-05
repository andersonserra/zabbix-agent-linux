##################################################################################################################
#Instalar pacotes basicos para gerenciamento do sistema operacional:
function ubuntu_system {
apt-get update -y
apt-get install wget vim screen nmap net-tools traceroute tcpdump htop dnsutils open-vm-tools make gcc python3 libpcre3-dev -y
}


##################################################################################################################
#UBUNTU 14 SERVER
##################################################################################################################
function zabbix_agent_ubuntu14 {
#Baixar pacote de instalação para Ubuntu
wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+trusty_all.deb
#ETAPA 2 - DPKG INSTALL
#remover release atual zabbix (em caso existente)
dpkg -r zabbix-release
#Instalar repositorio atual zabbix
dpkg -i zabbix-release_5.0-1+trusty_all.deb
## etap 3 - APT UPDATE
apt update -y
#Instalar pacote zabbix-agent
apt install zabbix-agent -y
#Realizar backup do arquivo de configuração original do zabbix
cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bkp
#Carregar configurações do zabbix-agent para o arquivo de configuração padrao:
echo "
PidFile=/run/zabbix/zabbix_agentd.pid
LogFile=/var/log/zabbix_agentd.log
LogFileSize=0
DebugLevel=0
AllowRoot=1
EnableRemoteCommands=1
Server=10.22.8.233,10.22.8.234,10.22.8.235,10.22.8.236
StartAgents=10
Hostname=`hostname -f`
Timeout=15
" > /etc/zabbix/zabbix_agentd.conf
service zabbix-agent restart
update-rc.d zabbix-agent enable
}

##################################################################################################################
#UBUNTU 16 SERVER
##################################################################################################################
function zabbix_agent_ubuntu16 {
#Baixar pacote de instalação para Ubuntu
wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+xenial_all.deb
#ETAPA 2 - DPKG INSTALL
#remover release atual zabbix (em caso existente)
dpkg -r zabbix-release
#Instalar repositorio atual zabbix
dpkg -i zabbix-release_5.0-1+xenial_all.deb
## etap 3 - APT UPDATE
apt update -y
#Instalar pacote zabbix-agent
apt install zabbix-agent -y
#Realizar backup do arquivo de configuração original do zabbix
cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bkp
#Carregar configurações do zabbix-agent para o arquivo de configuração padrao:
echo "
PidFile=/run/zabbix/zabbix_agentd.pid
LogFile=/var/log/zabbix_agentd.log
LogFileSize=0
DebugLevel=0
AllowRoot=1
EnableRemoteCommands=1
Server=10.22.8.233,10.22.8.234,10.22.8.235,10.22.8.236
StartAgents=10
Hostname=`hostname -f`
Timeout=15
" > /etc/zabbix/zabbix_agentd.conf
systemctl restart zabbix-agent
systemctl enable zabbix-agent
}


##################################################################################################################
#UBUNTU 18 SERVER
##################################################################################################################
function zabbix_agent_ubuntu18 {
#Baixar pacote de instalação para Ubuntu
wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+bionic_all.deb
#ETAPA 2 - DPKG INSTALL
#remover release atual zabbix (em caso existente)
dpkg -r zabbix-release
#Instalar repositorio atual zabbix
dpkg -i zabbix-release_5.0-1+bionic_all.deb
## etap 3 - APT UPDATE
apt update -y
#Instalar pacote zabbix-agent
apt install zabbix-agent -y
#Realizar backup do arquivo de configuração original do zabbix
cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bkp
#Carregar configurações do zabbix-agent para o arquivo de configuração padrao:
echo "
PidFile=/run/zabbix/zabbix_agentd.pid
LogFile=/var/log/zabbix_agentd.log
LogFileSize=0
DebugLevel=0
AllowRoot=1
EnableRemoteCommands=1
Server=10.22.8.233,10.22.8.234,10.22.8.235,10.22.8.236
StartAgents=10
Hostname=`hostname -f`
Timeout=15
" > /etc/zabbix/zabbix_agentd.conf
systemctl restart zabbix-agent
systemctl enable zabbix-agent
}

##################################################################################################################
#UBUNTU 20 SERVER
##################################################################################################################
function zabbix_agent_ubuntu20 {
#Baixar pacote de instalação para Ubuntu
wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+focal_all.deb
#ETAPA 2 - DPKG INSTALL
#remover release atual zabbix (em caso existente)
if [ `dpkg -l | grep zabbix-release` -eq 0]; 
then
dpkg -r zabbix-release
fi
#Instalar repositorio atual zabbix
dpkg -i zabbix-release_5.0-1+focal_all.deb
## etap 3 - APT UPDATE
apt update -y
#Instalar pacote zabbix-agent
apt install zabbix-agent -y
#Realizar backup do arquivo de configuração original do zabbix
cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bkp
#Carregar configurações do zabbix-agent para o arquivo de configuração padrao:
echo "
PidFile=/run/zabbix/zabbix_agentd.pid
LogFile=/var/log/zabbix_agentd.log
LogFileSize=0
DebugLevel=0
AllowRoot=1
EnableRemoteCommands=1
Server=10.22.8.233,10.22.8.234,10.22.8.235,10.22.8.236
StartAgents=10
Hostname=`hostname -f`
Timeout=15
" > /etc/zabbix/zabbix_agentd.conf
systemctl restart zabbix-agent
systemctl enable zabbix-agent
}



