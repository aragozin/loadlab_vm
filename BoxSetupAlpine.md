VirtualBox VM configuration
---------------------------

Use Alpine seed image TODO

 - CPU 1 core
 - Memory 2048 MiB
 - HDD
 - NIC 1 - NAT (Paravitrualized driver)
 - NIC 2 - Host only adapter. Promiscous mode: Allow All! (Paravitrualized driver)

SSH to VM

 - Host: 127.1.1.2
 - Account: root/toor

You may change SSH host IP in VM configuration (see port forwarding under network settings)


Setup software on the box
-------------------------

As root

TODO configure network/bridge

    apk add git

    mkdir -p /home/boss
    cd /home/boss
    git clone git://192.168.100.1/ setup
    cd setup
    git remote add github https://github.com/aragozin/loadlab_vm.git

    apk add ansible

    ansible-playbook /home/boss/setup/ansible/provision.ubuntu/init-lxd.yml
    
    ansible-playbook /home/boss/setup/ansible/cluster/make-cluster.yml

    ansible-playbook -i /home/boss/setup/ansible/deployment/loadlab.hosts --extra-vars "wp_db_import_dump=true" /home/boss/setup/ansible/deployment/loadlab.yml

Virtual Cluster topology
------------------------
 
 - 192.168.100.140 - loadbalancer (wp.loadlab.ragozin.info)
 - 192.168.100.141 - web1 (web1.loadlab.ragozin.info)
 - 192.168.100.142 - web1 (web2.loadlab.ragozin.info)
 - 192.168.100.143 - database
 - 192.168.100.144 - metrics
 - 192.168.100.145 - front (loadlab.ragozin.info)