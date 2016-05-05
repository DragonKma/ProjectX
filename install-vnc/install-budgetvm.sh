#!/bin/bash -ex
PASS=1q2w3e4r
 
apt-get -y update
apt-get -y install expect jwm vnc4server xterm nano curl
 
/usr/bin/expect - << EOF1
spawn /usr/bin/vncserver on
expect "Password:"
send "$PASS\r"
expect "Verify:"
send "$PASS\r"
expect eof
EOF1
 
vncserver
vncserver -kill :1
wget http://dragonkma.github.io/PrivateTE/budgetvm/xstartup -O /root/.vnc/xstartup
wget http://dragonkma.github.io/PrivateTE/budgetvm/vncserver -O /etc/init.d/vncserver
chmod +x /etc/init.d/vncserver
mkdir -p /etc/vncserver
wget http://dragonkma.github.io/PrivateTE/budgetvm/vncservers.conf -O /etc/vncserver/vncservers.conf
update-rc.d vncserver defaults 9
vncserver
 
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
apt-get install -y --force-yes apt-transport-https
apt-get update -y
apt-get -y install google-chrome-stable
 
cd /root
wget http://dragonkma.github.io/PrivateTE/budgetvm/all.sh -O /root/all.sh
chmod +x all.sh
wget http://dragonkma.github.io/PrivateTE/budgetvm/startme.sh -O /root/startme.sh
chmod +x startme.sh
echo '0 6 * * * root reboot' >> /etc/crontab

reboot
