sudo apt-get -y install ansible

ansible-playbook /home/boss/setup/ansible/provision.ubuntu/init-lxd.yml

sudo ansible-playbook /home/boss/setup/ansible/provision.ubuntu/init-bridge-adapter.yml

