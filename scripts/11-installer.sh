#!/usr/bin/env bash

rm -rf "${WORKING_DIR}"/*
mkdir -p /chevereto && mkdir -p /chevereto/{download,installer}
cd /chevereto/download
curl -S -o installer.tar.gz -L "https://github.com/chevereto/installer/archive/${CHEVERETO_INSTALLER_TAG}.tar.gz"
tar -xvzf installer.tar.gz
mv -v installer-"${CHEVERETO_INSTALLER_TAG}"/installer.php "${WORKING_DIR}"/installer.php
cd $WORKING_DIR
chown www-data: $WORKING_DIR -R
