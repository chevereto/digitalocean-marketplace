#!/usr/bin/env bash

set -o errexit

curl -f -SOJL \
    --output-dir /etc/apache2 \
    https://raw.githubusercontent.com/chevereto/vps/4.0/common/cf-remoteip.sh
