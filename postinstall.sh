#!/bin/bash

# postinstall script v0.5

# sudo check
if [ "$EUID" -ne 0 ]
  then echo "RUN AS ROOT!"
  exit
fi

# add sources
cat sources/bookworm-sources.list >> /etc/apt/sources.list

# add virtualbox gpg and sources
curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc| gpg --dearmor -o /etc/apt/trusted.gpg.d/vbox.gpg
curl -fsSL https://www.virtualbox.org/download/oracle_vbox.asc| gpg --dearmor -o /etc/apt/trusted.gpg.d/oracle_vbox.gpg

# apt update
apt update -y

# install base packages
xargs apt install -y < packages/base_packages

# install clamav packages
xargs apt install -y < packages/clamav_packages

# install hardening packages
xargs apt install -y < packages/hardening_packages
wget https://www.debian.org/security/oval/oval-definitions-$(lsb_release -cs).xml.bz2
bzip2 -d oval-definitions-bookworm.xml.bz2

# configure virtualbox
source scripts/virtualbox_install.sh

# configure clamav
source scripts/clamav_install.sh
