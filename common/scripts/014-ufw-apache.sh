#!/bin/bash

ufw limit ssh
ufw allow 'Apache Full'

ufw --force enable
