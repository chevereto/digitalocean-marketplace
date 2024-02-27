#!/usr/bin/env bash

set -o errexit

ufw limit ssh
ufw allow http
ufw allow https
ufw --force enable
