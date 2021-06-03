#!/bin/bash

echo $(date -u) ": System provisioning started." >>/var/log/per-instance.log

MYSQL_ROOT_PASS=$(openssl rand -hex 24)
DEBIAN_SYS_MAINT_MYSQL_PASS=$(openssl rand -hex 24)

CHEVERETO_DB_HOST=localhost
CHEVERETO_DB_PORT=3306
CHEVERETO_DB_NAME=chevereto
CHEVERETO_DB_USER=chevereto
CHEVERETO_DB_PASS=$(openssl rand -hex 24)

cat >/root/.mysql_password <<EOM
MYSQL_ROOT_PASS="${MYSQL_ROOT_PASS}"
EOM

mysql -u root -e "CREATE DATABASE $CHEVERETO_DB_NAME;"
mysql -u root -e "CREATE USER '$CHEVERETO_DB_USER'@'$CHEVERETO_DB_HOST' IDENTIFIED BY '$CHEVERETO_DB_PASS';"
mysql -u root -e "GRANT ALL ON *.* TO '$CHEVERETO_DB_USER'@'$CHEVERETO_DB_HOST';"

mysqladmin -u root -h localhost password $MYSQL_ROOT_PASS

mysql -uroot -p${MYSQL_ROOT_PASS} \
    -e "ALTER USER 'debian-sys-maint'@'localhost' IDENTIFIED BY '$DEBIAN_SYS_MAINT_MYSQL_PASS';"

MYSQL_ROOT_PASSWORD=${DEBIAN_SYS_MAINT_MYSQL_PASS}

SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"$MYSQL_ROOT_PASSWORD\r\"
expect \"Change the root password?\"
send \"n\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
expect \"Disallow root login remotely?\"
send \"y\r\"
expect \"Remove test database and access to it?\"
send \"y\r\"
expect \"Reload privilege tables now?\"
send \"y\r\"
expect eof
")

echo "$SECURE_MYSQL"

set -eux
{
    echo "<?php"
    echo "\$settings = ["
    echo "    'db_host' => '$CHEVERETO_DB_HOST',"
    echo "    'db_name' => '$CHEVERETO_DB_NAME',"
    echo "    'db_user' => '$CHEVERETO_DB_USER',"
    echo "    'db_pass' => '$CHEVERETO_DB_PASS',"
    echo "    'db_port' => '$CHEVERETO_DB_PORT',"
    echo "    'db_table_prefix' => 'chv_',"
    echo "    'db_driver' => 'mysql',"
    echo "    'debug_level' => 1,"
    echo "];"
} >/var/www/html/app/settings.php
echo $(date -u) ": Created /var/www/html/app/settings.php" >>/var/log/per-instance.log
chown www-data: /var/www/html/app/settings.php

cat >/etc/mysql/debian.cnf <<EOM
# Automatically generated for Debian scripts. DO NOT TOUCH!
[client]
host     = localhost
user     = debian-sys-maint
password = ${DEBIAN_SYS_MAINT_MYSQL_PASS}
socket   = /var/run/mysqld/mysqld.sock
[mysql_upgrade]
host     = localhost
user     = debian-sys-maint
password = ${DEBIAN_SYS_MAINT_MYSQL_PASS}
socket   = /var/run/mysqld/mysqld.sock
EOM

sed -e '/Match User root/d' \
    -e '/.*ForceCommand.*droplet.*/d' \
    -i /etc/ssh/sshd_config

systemctl restart ssh

echo $(date -u) ": System provisioning script is complete." >>/var/log/per-instance.log
