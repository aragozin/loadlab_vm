sudo apt-get -y install ansible

ansible-playbook /home/boss/setup/ansible/provision.ubuntu/init-bridge-adapter.yml

ansible-playbook /home/boss/setup/ansible/provision.ubuntu/init-lxd.yml