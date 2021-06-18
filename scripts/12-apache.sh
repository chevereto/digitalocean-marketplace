#!/usr/bin/env bash

chown -R www-data: /var/log/apache2
chown -R www-data: /etc/apache2
chown -R www-data: $WORKING_DIR

a2enmod rewrite
