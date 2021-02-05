function ssh_keys
{
#anderson
useradd -m anderson
mkdir /home/anderson/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9Twv7QwUh++b1kAKrEGkRtSYqPflT+6cU8UmIOzzDU35BzWd/aWm2/BkPspsf8KcLKf4iP+Rl6STKWq5YaUI6znXPPmMUi19YzHnoLkk3X7Vvgt54gdafQryFZIi3ssyJ7G3RdS87XHNgYYG71qqqvFiqpcw9sZHKU2Ru+CIMNXvC8Y1Juh3Q5F+TGMB+fJvguR8jrbJ1QblFvDt2xEwbDK4Jf2tAqSTPV3xk9eHMoNg3EEuJjKEmACye+BtQv0OECndO3tBCrK6eZ9l5GqnHKn8v32+nhMLlpzmY1pshw6m5ahovr91wACY0yGw/CX0AKlLaanI6WgX8RdgqaFklkvisAtwCpPmy39xU6sq5oSu/5MTa8+mnJMkx9U3to+z+NUHvxeTXbVZ0dHPabp6wGMFKRyYgtnjnoUDDXT7/oi9aEBJuFr2TVz7HvacFG3BKuC6A8RvnkrJu1CS1FfdRYvAk5agOEp3poCvCnu4ITIroC92IttHYNSiPpJqT6R76RhtteLYN72809fcPMYO+w1etmbqjCagpuJH1S9XFP3K8dTuUT5fFkmwW7yIgDjTIyjq2pVHIhIE9ECDSzyUMbz8gvH2dkRuCRPHzOBFylJiL3qpGUy9lpteIZnxrvjW94q3nyZiIf/zDpZHYb6p47KC7qrz8CoSHErzmLFvz2Q== anderson.serra@seati.ma.gov.br" > /home/anderson/.ssh/authorized_keys
chmod 700 /home/anderson/.ssh
chmod 600 /home/anderson/.ssh/authorized_keys
chmod -R go= /home/anderson/.ssh
chown -R anderson:anderson /home/anderson/.ssh

#wesley
useradd -m wesley
mkdir /home/wesley/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAiftsrRES9E33K8g+QrqT5gJLxHEBQNu/QNT0FaEFbhcmAjhBkeNLw/eYvkOcc+v/FnyAllwUCRSxVeDY33BHKrS/3AfG4Grykt8zPuoKtAICMIe3EbAPzKL2XarNbRmrR9cnr8bOF8ddcCWHuSwMklny7ibmuWDpDr0BsGeVDDNiKHO9XbG/UAWqXxyDo3uzzu7jxVopdJW6XpkuhKRhkqTx1evbdg5uEdPNXnajp8c4vlH6mLj0Ac8hLnqz7Fav67W9zp+RB6YgDiqZGNnnjbMAsV0RtLuUkkb6SHFTMktigOjRqjsPn43nvO2ChnUOsHYLlk2z/2sWRQoRx0TySQ== wesley" > /home/wesley/.ssh/authorized_keys
chmod 700 /home/wesley/.ssh
chmod 600 /home/wesley/.ssh/authorized_keys
chmod -R go= /home/wesley/.ssh
chown -R wesley:wesley /home/wesley/.ssh

#edilson
useradd -m edilson
mkdir /home/edilson/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7nnRMXqRcY6Pwoc0EY8X/dbacRGxPo0pa4r88dTrhL2DtT2ZiIvoDSCF6Q4z+2pLQcXfL3C161X3ysl5S1x4lERFUc4aS4n2H2evuDfguq7CR8VoubnlgOh8WqwY4jTfy4iMn2VfvTWYsfQlzSICzq7H9gLleIatdtxwVC8rqHxjSp5jG5l45g9qieCTmfExmm1UKDmpaimVMskxLF4Dkno+zMsUCdLeiT701hzlL/R+s3akwhXku82dqQx+aHxMbo1/hnfGr4vZc3n58QahgjLAzzXJt4QVUwiRgUsY0k8F/SJr5U5evPjTlMYv6EcdGjK9unQbbZYgPaqtV69isFWcxIgbtLafAIWs2g8r4qUW9XiN4jTafedC+bfjdKUJa0qcwBxzRF9shZg8agG12QauWQiIf1VtMB8IV/eqZVSIgXGBmd1DZMq33m+McjFqc9L1CLjZf51+csQaZd5MKv+VTnY9vK4BkzTBqodf1gssr1LR3dIvkk0FSpXKUfXsM9+3UvoK0zFEfoHG2AcHy5yU8Fbj5HaWJUJ+uCKLwGi36akJFUntleYbGciQlJTykpJLwJ+59UF0iXELzlYTtSTIq6ZOSZacBYgyhZil+Z0G4TuLPuVMUIF0qj4cADSB6WWGKh6vS9jEVyuJtTRIZpzMSR2y+J9vR+In1uSfUeQ== edilson.viana@seati.ma.gov.br" > /home/edilson/.ssh/authorized_keys
chmod 700 /home/edilson/.ssh
chmod 600 /home/edilson/.ssh/authorized_keys
chmod -R go= /home/edilson/.ssh
chown -R edilson:edilson /home/edilson/.ssh

###################################################################################
#Configuração do banner pre-login
mkdir -p /etc/ssh/banner/
echo "==========================================================================

WARNING:  Unauthorized access to this system is forbidden and will be
prosecuted by law. By accessing this system, you agree that your actions
may be monitored if unauthorized usage is suspected.

SEATI-SEGOV

==========================================================================
" > /etc/ssh/banner/pre-login

#####################################################################################
#Configuração MOTD pos autenticacao
grep "Banner /etc/ssh/banner/pre-login" /etc/ssh/sshd_config
[ $? -ne 0 ] || echo "Banner /etc/ssh/banner/pre-login" >> /etc/ssh/sshd_config
echo "==========================================================================

..######..########....###....########.####
.##....##.##.........##.##......##.....##.
.##.......##........##...##.....##.....##.
..######..######...##.....##....##.....##.
.......##.##.......#########....##.....##.
.##....##.##.......##.....##....##.....##.
..######..########.##.....##....##....####

==========================================================================
Warning: you are entering into a secured area!
Your IP, Login Time, Username has been stored
and has been sent to the server administrator!
This service is restricted to authorized users only.
All activities on this system are logged.
Unauthorized access will be fully investigated
and reported to the appropriate law enforcement agencies.
==========================================================================
" > /etc/motd

###################################################################################
#Configuração arquivo de configuração sshd_config
echo "
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key
SyslogFacility AUTHPRIV
PermitRootLogin no
AuthorizedKeysFile      .ssh/authorized_keys
PasswordAuthentication no
ChallengeResponseAuthentication no
GSSAPIAuthentication yes
GSSAPICleanupCredentials no
UsePAM yes
X11Forwarding yes
PrintMotd no
Banner /etc/ssh/banner/pre-login
AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES
AcceptEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT
AcceptEnv LC_IDENTIFICATION LC_ALL LANGUAGE
AcceptEnv XMODIFIERS
Subsystem       sftp    /usr/libexec/openssh/sftp-server

" > /etc/ssh/sshd_config

case $sistema in
Centos)
        systemctl restart sshd
        ;;
Debian)
        /etc/init.d/ssh restart
        ;;
Ubuntu)
        /etc/init.d/ssh restart
        ;;
esac

}

