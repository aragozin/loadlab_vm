To start local git daemon
=========================

Allow repository to be served

     touch .git/git-daemon-export-ok

Start daemon

     git daemon --base-path=.

Inside VM clone (use IP on host network)

     git clone git://192.168.100.1/ 