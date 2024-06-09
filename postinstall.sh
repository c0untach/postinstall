#!/bin/bash

# postinstall script v0.5

# sudo check
if [ "$EUID" -ne 0 ]
  then echo "RUN AS ROOT!"
  exit
fi

# install base packages
xargs apt install -y < base_packages
