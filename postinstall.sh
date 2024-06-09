#!/bin/bash

# postinstall script v0.5

# sudo check
if [ "$EUID" -ne 0 ]
  then echo "RUN AS ROOT!"
  exit
fi

# add bookworm sources
xargs echo -e >/etc/apt/sources.list < sources/bookworm-sources.list

# apt update
apt update -y

# install base packages
xargs apt install -y < packages/base_packages
