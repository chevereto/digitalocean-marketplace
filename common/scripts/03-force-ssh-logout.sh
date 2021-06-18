#!/usr/bin/env bash

cat >>/etc/ssh/sshd_config <<EOM
Match User root
        ForceCommand echo "Please wait while we get your server ready..."
EOM
