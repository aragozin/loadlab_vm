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

VirtualBox host only network
----------------------------

Configure VirtualBox host only network

 - IPv4 Address: 192.168.100.1
 - IPv4 Mask: 255.255.255.0
 - IPv6 turned off
 - DHCP is not enabled


Initial host setup
------------------

Get initial playbook files to the VM, two options are below

Get initial playbook from local source

    # clone https://github.com/aragozin/loadlab_vm.git to your desktop machine

    mkdir -p /opt/loadlab/setup

    # copy content of repo to /opt/loadlab/setup via sftp

    cd /opt/loadlab/setup/ansible/provision.alpine
    apk add ansible
    ansible-playbook ansible/provision.alpine/host-setup.yml

     
Get initial playbook from github repo

    apk add git
    mkdir -p /opt/loadlab
    git clone github https://github.com/aragozin/loadlab_vm.git setup

Install LXD and apply host configuration

    cd /opt/loadlab/setup/
    apk add ansible
    ansible-playbook ansible/provision.alpine/host-setup.yml

Reboot VM

    reboot
    
Now VM is also available though your host only VirtualBox network (192.168.100.61).

Local git server is also available to be used in VM now.


Lab deploymnet
---------

Link source for working locally

    apk add git

    cd /opt/loadlab
    rm -rf setup
    git clone https://github.com/aragozin/loadlab_vm.git setup
    cd setup

    # optionally link, locally served git repo
    git add local git://192.168.100.1/
    git fetch local

    apk add ansible

    # Wipe old container for clean setup
    ansible-playbook /opt/loadlab/setup/ansible/cluster/force-wipe-cluster.yml

    # Build containers
    ansible-playbook /opt/loadlab/setup/ansible/cluster/make-cluster.yml

    ansible-playbook -i /home/boss/setup/ansible/deployment/loadlab.hosts --extra-vars "wp_db_import_dump=true" /home/boss/setup/ansible/deployment/loadlab.yml

Virtual Cluster topology
------------------------
 
 - 192.168.100.140 - loadbalancer (wp.loadlab.ragozin.info)
 - 192.168.100.141 - web1 (web1.loadlab.ragozin.info)
 - 192.168.100.142 - web1 (web2.loadlab.ragozin.info)
 - 192.168.100.143 - database
 - 192.168.100.144 - metrics
 - 192.168.100.145 - front (loadlab.ragozin.info)