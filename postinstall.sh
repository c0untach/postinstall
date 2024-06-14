#!/bin/bash

# postinstall script v0.5

# sudo check
if [ "$EUID" -ne 0 ]
  then echo "RUN AS ROOT!"
  exit
fi

# add virtulabox gpg
curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/vbox.gpg

# add bookworm sources
xargs echo -e >/etc/apt/sources.list < sources/bookworm-sources.list

# add virtualbox sources
xargs echo -e >/etc/apt/sources.list.d/virtualbox.list < sources/virtualbox-sources.list

# apt update
apt update -y

# install base packages
xargs apt install -y < packages/base_packages
