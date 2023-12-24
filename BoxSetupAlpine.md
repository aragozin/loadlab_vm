VirtualBox VM configuration
---------------------------

VirtualBox host only network
----------------------------

Lab environment requires secific host only network setup.

Configure VirtualBox host only network

 - IPv4 Address: 192.168.100.1
 - IPv4 Mask: 255.255.255.0
 - IPv6 turned off
 - DHCP is not enabled

VirtualBox support multiple networks.


Build new Apline VM with Virtula Box
------------------------------------

Create new Linux VM

 - CPU 1 core
 - Memory 2048 MiB
 - HDD 8GiB (details?)
 - NIC 1 - NAT (Paravitrualized driver)
 - NIC 2 - Host only adapter. Promiscous mode: Allow All! (Paravitrualized driver)

 - CPU 1 core
 - Memory 2048 MiB
 - HDD
 - NIC 1 - NAT (Paravitrualized driver)
 - NIC 2 - Host only adapter. Promiscous mode: Allow All! (Paravitrualized driver)

NIC 2 should be connected to Host only network configured as above.

Use alpine "Virtual" ISO image.

Start installation with setup-alpine

 - enter some passord for root
 - use LVM option for disk format
 - allow ssh under root account with password

After initial installation is complete, you may need to configure port forwarding to access VM via SSH.
Go to "Advanced" settings in Adapte1 in VM's networking and add port forwarding rule for port 22.
Choose some 127.x.x.x address for local and pick VM's internal IP using `ip addr`

Verify SSH to VM is working.


Initial VM host setup
------------------

Get initial playbook from github repo

    apk add git
    mkdir -p /opt/loadlab
    cd /opt/loadlab
    git clone https://github.com/aragozin/loadlab_vm.git setup

Enable Alpine community repo

    vi /etc/apk/repositories
    # uncomment line with community repo URL and `wq`

Install ansible

    apk add ansible

Configure network (may be omitted if you are not swicthing to local git server)

    cd /opt/loadlab/setup/
    ansible-playbook ansible/provision.alpine/host-setup-network.yml

Switch branch to local git server (see [LocalGit.md] to start local git). This step can be ommited if you build from master on GitHub

    git remote add local git://192.168.100.1/
    git fetch local
    # if fetch fails, verify that git daemon process is running on your host
    git branch master --set-upstream-to local/master
    git pull

Proceed with VM setup

    cd /opt/loadlab/setup/
    ansible-playbook ansible/provision.alpine/host-setup.yml
       
Reboot VM

    reboot
    
Now VM is also available though your host only VirtualBox network (192.168.100.61).


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