#!/bin/sh
/usr/bin/ansible-playbook -i inventory arch-desktop.yml --ask-sudo-pass
./install-dotfiles.sh
./install-dwm.sh
