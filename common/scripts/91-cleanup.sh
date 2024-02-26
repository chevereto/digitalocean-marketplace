#!/bin/bash

set -o errexit

sudo apt-get -y purge droplet-agent
rm -rf /var/log/auth.log /var/log/kern.log /var/log/ubuntu-advantage.log
