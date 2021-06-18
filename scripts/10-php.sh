#!/usr/bin/env bash

set -eux
{
    echo "log_errors = On"
    echo "upload_max_filesize = 50M"
    echo "post_max_size = 50M"
    echo "max_execution_time = 30"
    echo "memory_limit = 512M"
} >/etc/php/7.4/apache2/conf.d/chevereto.ini
