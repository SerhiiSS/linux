#!/bin/sh
sudo apt update 
sudo apt install build-essential zlib1g-dev libssl-dev -y
sudo mkdir /var/lib/sshd
sudo chmod -R 700 /var/lib/sshd/
sudo chown -R root:sys /var/lib/sshd/
wget -c https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.2p1.tar.gz
tar -xzf openssh-9.2p1.tar.gz
cd openssh-9.2p1/
sudo apt install libpam0g-dev libselinux1-dev libkrb5-dev -y
./configure --with-kerberos5 --with-md5-passwords --with-pam --with-selinux --with-privsep-path=/var/lib/sshd/ --sysconfdir=/etc/ssh
make
sudo make install
sshd -V
