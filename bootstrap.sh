#!/bin/sh

sudo apt install -y ansible

ansible-playbook -v -K playbook.yml
