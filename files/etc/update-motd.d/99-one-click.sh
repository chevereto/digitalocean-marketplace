#!/bin/bash
#
# Configured as part of the DigitalOcean 1-Click Image build process

myip=$(hostname -I | awk '{print$1}')
cat <<EOF
********************************************************************************

Welcome to DigitalOcean's One-Click Chevereto Droplet.
To keep this Droplet secure, the UFW firewall is enabled.
All ports are BLOCKED except 22 (SSH), 80 (HTTP), and 443 (HTTPS).

In a web browser, you can view:
 * The new Chevereto site: http://$myip

On the server:
 * The default web root is located at /var/www/html
 * The MySQL root password is saved at
   in /root/.mysql_password
 * Certbot is preinstalled, to configure HTTPS run:
   certbot --apache -d example.com -d example.com

IMPORTANT:
   After connecting to the Droplet for the first time,
   immediately add the Chevereto administrator at http://$myip

For help and more information, visit https://chevereto.com

********************************************************************************
To delete this message of the day: rm -rf $(readlink -f ${0})
EOF
