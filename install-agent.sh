#/bin/bash

#CARREGA VARIAVEIS DE SISTEMAS (NAME, VERSION_ID, VERSION, ID)
. /etc/os-release
. centos.sh
. debian.sh
. ubuntu.sh
. ssh_config_keys.sh


#Codicional para verificação de sistema operacional:
case $ID in

debian)
        case $VERSION_CODENAME in
        jessie)
                debian_system
                zabbix_agent_debian8
                ;;
        stretch)
                debian_system
                zabbix_agent_debian9
                ;;
        buster)
                debian_system
                zabbix_agent_debian10
                ;;
        esac
        ;;
centos)
        case $VERSION_ID in
        6)
                centos_system
                zabbix_agent_centos6
                ;;
        7)
                centos_system
                zabbix_agent_centos7
                ;;
        8)
                centos_system
                zabbix_agent_centos8
                ;;
        esac
        ;;
ubuntu)
        case $VERSION_CODENAME in
        trusty)
            ubuntu_system
            zabbix_agent_ubuntu14
            ;;
        xenial)
            ubuntu_system
            zabbix_agent_ubuntu16
            ;;
        bionic)
            ubuntu_system
            zabbix_agent_ubuntu18
            ;;
        focal)
            ubuntu_system
            zabbix_agent_ubuntu20
            ;;
        esac
        ;;
esac

ssh_keys

