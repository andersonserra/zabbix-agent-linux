#Instalar pacotes basicos de utilitarios de infraestrutura
function debian_system {
apt-get update -y
apt-get install wget vim screen nmap net-tools traceroute tcpdump htop dnsutils open-vm-tools make gcc python3 -y
}

############################################################################
function zabbix_agent_debian8 {

#Baixar pacote de instalação para Debian 9 stretch
wget https://repo.zabbix.com/zabbix/5.0/debian/pool/main/z/zabbix-release/zabbix-release_5.0-1+jessie_all.deb
#ETAPA 2 - DPKG INSTALL
dpkg -i zabbix-release_5.0-1+jessie_all.deb
## etap 3 - APT UPDATE
apt update -y
#Instalar pacote zabbix-agent
apt install zabbix-agent -y
#Realizar backup do arquivo de configuração original do zabbix
cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bkp
#Carregar configurações do zabbix-agent para o arquivo de configuração padrao:
echo "
PidFile=/tmp/zabbix_agentd.pid
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

#################################################################################
function zabbix_agent_debian9 {

#Baixar pacote de instalação para Debian 9 stretch
wget https://repo.zabbix.com/zabbix/5.0/debian/pool/main/z/zabbix-release/zabbix-release_5.0-1+stretch_all.deb
#ETAPA 2 - DPKG INSTALL
#remover release existente
dpkg -r zabbix-release
#instalar release versao 5
dpkg -i zabbix-release_5.0-1+stretch_all.deb
## etap 3 - APT UPDATE
apt update -y
#Instalar pacote zabbix-agent
apt install zabbix-agent -y
#Realizar backup do arquivo de configuração original do zabbix
cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bkp
#Carregar configurações do zabbix-agent para o arquivo de configuração padrao:
echo "
PidFile=/tmp/zabbix_agentd.pid
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


#################################################################################
function zabbix_agent_debian10 {

#Baixar pacote de instalação para Debian 9 stretch
wget https://repo.zabbix.com/zabbix/5.0/debian/pool/main/z/zabbix-release/zabbix-release_5.0-1+buster_all.deb
#ETAPA 2 - DPKG INSTALL
#remover release existente
dpkg -r zabbix-release
#instalar release versao 5
dpkg -i zabbix-release_5.0-1+buster_all.deb
## etap 3 - APT UPDATE
apt update -y
#Instalar pacote zabbix-agent
apt install zabbix-agent -y
#Realizar backup do arquivo de configuração original do zabbix
cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bkp
#Carregar configurações do zabbix-agent para o arquivo de configuração padrao:
echo "
PidFile=/tmp/zabbix_agentd.pid
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
#################################################################################


