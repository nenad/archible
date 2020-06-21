# archible

My ArchLinux setup in Ansible playbooks

## Prerequisites

- Empty block device (ex. /dev/sda)
- Internet connection

## Usage

After booting from a live ArchLinux USB and setting up Internet connection, run the following commands:

- `git clone https://github.com/nenad/archible` - clones this repository
- `sudo sh archible/setup.sh` - installs Ansible and runs all the playbooks
