#!/usr/bin/env bash

set -o errexit

CHEVERETO_API_DOWNLOAD="https://chevereto.com/api/download/"
CHEVERETO_LABEL="Chevereto v$CHEVERETO_TAG"
rm -rf "${WORKING_DIR}"/*
rm -rf .temp && mkdir .temp && cd .temp
echo "[INFO] Downloading chevereto/chevereto $CHEVERETO_LABEL..."
curl -f -SOJL "${CHEVERETO_API_DOWNLOAD}${CHEVERETO_TAG}"
unzip -oq *.zip -d $WORKING_DIR
cd -
rm -rf .temp
if id "www-data" &>/dev/null; then
    chown -R www-data: $WORKING_DIR
else
    echo '[NOTICE] www-data user not found, skipping ownership change'
fi
echo "[OK] $CHEVERETO_LABEL files provisioned"
cd $WORKING_DIR
