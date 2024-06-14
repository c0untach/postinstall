#!/bin/bash

# postinstall script v0.5

# sudo check
if [ "$EUID" -ne 0 ]
  then echo "RUN AS ROOT!"
  exit
fi

# add bookworm sources
xargs echo -e >/etc/apt/sources.list < sources/bookworm-sources.list

# add virtualbox gpg and sources
curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc| gpg --dearmor -o /etc/apt/trusted.gpg.d/vbox.gpg
curl -fsSL https://www.virtualbox.org/download/oracle_vbox.asc| gpg --dearmor -o /etc/apt/trusted.gpg.d/oracle_vbox.gpg
xargs echo -e >/etc/apt/sources.list.d/virtualbox.list < sources/virtualbox-sources.list

# apt update
apt update -y

# install base packages
xargs apt install -y < packages/base_packages

# install virtualbox packages
xargs apt install -y < packages/virtualbox_packages

# install clamav packages
xargs apt install -y < packages/clamav_packages

# configure virtualbox
source scripts/virtualbox_install.sh

# configure clamav
source scripts/clamav_install.sh
