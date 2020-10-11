#!/bin/sh

mkdir -p /opt/loadlab/config/limits/

lxc config set loadbalancer limits.cpu.allowance "40ms/200ms"
echo "lxcstats,lxc_host=loadbalancer cpu_limit=0.2" > /opt/loadlab/config/limits/loadbalance.limit

lxc config set web1         limits.cpu.allowance "80ms/200ms"
echo "lxcstats,lxc_host=web1 cpu_limit=0.4" > /opt/loadlab/config/limits/web1.limit

lxc config set web2         limits.cpu.allowance "80ms/200ms"
echo "lxcstats,lxc_host=web2 cpu_limit=0.4" > /opt/loadlab/config/limits/web2.limit

lxc config set database     limits.cpu.allowance "100ms/200ms"
echo "lxcstats,lxc_host=database cpu_limit=0.5" > /opt/loadlab/config/limits/database.limit

lxc config set metrics      limits.cpu.allowance "40ms/200ms"
echo "lxcstats,lxc_host=metrics cpu_limit=0.2" > /opt/loadlab/config/limits/metrics.limit
lxc config set metrics      limits.cpu.priority "8"