
VirtualBox VM configuration

 - CPU 1 core
 - Memory 2048 MiB
 - HDD
 - NIC 1 - NAT
 - NIC 2 - Host only adapter. Promiscous mode: Allow All!

Setup box

Disable IPV6 : `sudo vi /etc/default/grub` | `ipv6.disable=1` | `sudo update-grub`


    git clone git://192.168.100.1/ setup
    cd setup

    sudo apt-get -y install ansible

    ansible-playbook /home/boss/setup/ansible/provision.ubuntu/init-lxd.yml
    
    sudo ansible-playbook /home/boss/setup/ansible/provision.ubuntu/init-bridge-adapter.yml


Virtual Cluster topology
------------------------
 
 - 192.168.100.140 - loadbalancer (web.loadlab.ragozin.info)
 - 192.168.100.141 - web1 (web1.loadlab.ragozin.info)
 - 192.168.100.142 - web1 (web2.loadlab.ragozin.info)
 - 192.168.100.143 - database
 - 192.168.100.144 - metrics
 - 192.168.100.145 - host (loadlab.ragozin.info)
 - 192.168.100.145 - tools