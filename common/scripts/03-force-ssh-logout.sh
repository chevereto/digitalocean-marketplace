#!/usr/bin/env bash

set -o errexit

cat >>/etc/ssh/sshd_config <<EOM
Match User root
        ForceCommand echo "Please wait while we get your server ready..."
EOM
