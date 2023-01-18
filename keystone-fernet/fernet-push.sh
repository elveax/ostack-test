#!/bin/bash

set -o errexit
set -o pipefail

if [ ! -z "$1" ] && [ "$1" == "--check" ]; then
/usr/bin/rsync --dry-run -az -e 'ssh -i /var/lib/keystone/.ssh/id_rsa -p 8023 -F /var/lib/keystone/.ssh/config' --delete /etc/keystone/fernet-keys/ keystone@10.210.0.21:/etc/keystone/fernet-keys
else
/usr/bin/rsync -az -e 'ssh -i /var/lib/keystone/.ssh/id_rsa -p 8023 -F /var/lib/keystone/.ssh/config' --delete /etc/keystone/fernet-keys/ keystone@10.210.0.21:/etc/keystone/fernet-keys
fi
