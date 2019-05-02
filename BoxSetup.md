
Provison conf files

    #ubuntu
    apt-get -y install ansible

    git clone git://192.168.100.1/ setup
    cd setup

    sudo bash ./ansible/provision.ubuntu.sh


Virtual Cluster topology
------------------------
 
 - 192.168.100.140 - loadbalancer (web.loadlab.ragozin.info)
 - 192.168.100.141 - web1 (web1.loadlab.ragozin.info)
 - 192.168.100.142 - web1 (web2.loadlab.ragozin.info)
 - 192.168.100.143 - database
 - 192.168.100.144
 - 192.168.100.145 - host (loadlab.ragozin.info)