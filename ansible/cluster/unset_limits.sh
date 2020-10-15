#!/bin/sh

lxc config set loadbalancer limits.cpu.allowance ""
lxc config set web1         limits.cpu.allowance ""
lxc config set web2         limits.cpu.allowance ""
lxc config set database     limits.cpu.allowance ""
lxc config set metrics      limits.cpu.allowance ""
lxc config set metrics      limits.cpu.priority ""
mkdir -p /opt/loadlab/config/limits/
rm /opt/loadlab/config/limits/*.limit