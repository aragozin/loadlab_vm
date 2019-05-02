#!/bin/bash

apt-get -y install ansible

sudo ansible-playbook -i /home/boss/setup/ansible/provision.ubuntu/hosts /home/boss/setup/ansible/provision.ubuntu/site.yaml