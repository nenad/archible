#!/bin/sh

set -ex

pacman -S --needed ansible
ansible-playbook -i 127.0.0.1, -K init-playbook.yml
