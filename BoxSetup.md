
VirtualBox VM configuration
---------------------------

Use `loadlab.ova` as starting point

 - CPU 1 core
 - Memory 2048 MiB
 - HDD
 - NIC 1 - NAT
 - NIC 2 - Host only adapter. Promiscous mode: Allow All!

Install Ubuntu 18 server
------------------------

Configure static IP - 192.168.100.145 for second adapter

Account: boss/boss


Setup software on the box
-------------------------

    git clone git://192.168.100.1/ setup
    cd setup
    git remote add github https://github.com/aragozin/loadlab_vm.git

    sudo apt-get -y install ansible

    ansible-playbook /home/boss/setup/ansible/provision.ubuntu/init-lxd.yml
    
    sudo ansible-playbook /home/boss/setup/ansible/provision.ubuntu/init-bridge-adapter.yml

    ansible-playbook /home/boss/setup/ansible/cluster/init-cluster.yml

Virtual Cluster topology
------------------------
 
 - 192.168.100.140 - loadbalancer (web.loadlab.ragozin.info)
 - 192.168.100.141 - web1 (web1.loadlab.ragozin.info)
 - 192.168.100.142 - web1 (web2.loadlab.ragozin.info)
 - 192.168.100.143 - database
 - 192.168.100.144 - metrics
 - 192.168.100.145 - host (loadlab.ragozin.info)