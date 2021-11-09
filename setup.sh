#!/bin/sh

set -eo pipefail

bytes_free=$(df /run/archiso/cowspace --output=size | tail -1)
if [ "$bytes_free" -lt 1048576 ]; then
	echo "The /run/archiso/cowspace disk space is less than 1 GB. Restart with kernel parameter 'cow_spacesize=1G'"
	exit 1
fi

if ! grep -q localhost /etc/ansible/hosts; then
	echo 'localhost' > /etc/ansible/hosts
fi

pacman -S --needed ansible

ansible-playbook init-playbook.yml
