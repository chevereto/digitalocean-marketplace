#!/usr/bin/env bash

ufw limit ssh
ufw allow 'Apache Full'
ufw --force enable
