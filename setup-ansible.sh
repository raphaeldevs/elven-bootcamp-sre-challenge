#!/usr/bin/env bash

# Install ansible
sudo apt update && sudo apt install ansible -y

# Runs playbook
ansible-pull -U https://github.com/raphaeldevs/elven-bootcamp-sre-challenge ansible-modules/blog/main.yml
