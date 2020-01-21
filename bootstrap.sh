#!/bin/sh

sudo apt install -y python3-pip

sudo -H pip3 install ansible==2.9.4

ansible-playbook -v -K playbook.yml
