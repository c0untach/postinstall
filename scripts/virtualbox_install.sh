# update and install
apt update -y 
apt install virtualbox-7.1 -y

# add user to vboxusers group
usermod -aG vboxusers user

# iniate shell for new group
newgrp vboxusers

# build kernel modules
/sbin/vboxconfig

# dowenload virtualbox extension pack
wget https://download.virtualbox.org/virtualbox/7.1.0/Oracle_VirtualBox_Extension_Pack-7.1.0.vbox-extpack -P /home/user/Downloads

# install virtualbox extension pack
vboxmanage extpack install /home/user/Downloads/Oracle_VirtualBox_Extension_Pack-7.1.0.vbox-extpack
