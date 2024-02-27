#!/usr/bin/env bash

set -o errexit

a2enmod rewrite
a2enmod remoteip
systemctl restart apache2
