#!/bin/bash

WORKING_DIR="/var/www/html"
CHEVERETO_SOFTWARE=chevereto-free
CHEVERETO_TAG=1.3.0
CHEVERETO_INSTALLER_TAG=2.2.2
CHEVERETO_LICENSE=
rm -rf /var/www/html/*
mkdir /chevereto && mkdir -p /chevereto/{download,installer}
cd /chevereto/download
curl -S -o installer.tar.gz -L "https://github.com/chevereto/installer/archive/${CHEVERETO_INSTALLER_TAG}.tar.gz"
tar -xvzf installer.tar.gz
mv -v installer-"${CHEVERETO_INSTALLER_TAG}"/* /chevereto/installer/
cd /chevereto/installer
php installer.php -a download -s $CHEVERETO_SOFTWARE -t=$CHEVERETO_TAG -l=$CHEVERETO_LICENSE
php installer.php -a extract -s $CHEVERETO_SOFTWARE -f chevereto-pkg-*.zip -p $WORKING_DIR
chown www-data: $WORKING_DIR -R
echo "[OK] $CHEVERETO_SOFTWARE $CHEVERETO_TAG provisioned"
