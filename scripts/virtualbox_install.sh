# add gpg keys
curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/vbox.gpg

# add soources
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

# update and install
apt update
apt install virtualbox-7.0

# add user to vboxusers group
usermod -aG vboxusers user

# iniate shell for new group
newgrp vboxusers

# dowenload virtualbox extension pack
wget https://download.virtualbox.org/virtualbox/7.0.18/Oracle_VM_VirtualBox_Extension_Pack-7.0.18.vbox-extpack -P /home/user/Downloads

# install virtualbox extension pack
vboxmanage extpack install Oracle_VM_VirtualBox_Extension_Pack-7.0.18.vbox-extpack
