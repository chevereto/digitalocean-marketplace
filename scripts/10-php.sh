#!/usr/bin/env bash

set -o errexit

cat >/etc/php/8.2/apache2/conf.d/chevereto.ini <<EOM
log_errors = On
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 60
memory_limit = 512M
EOM
