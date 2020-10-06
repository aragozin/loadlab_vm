#!/bin/sh

lxc config set loadbalancer limits.cpu.allowance "40ms/200ms"
lxc config set web1         limits.cpu.allowance "80ms/200ms"
lxc config set web2         limits.cpu.allowance "80ms/200ms"
lxc config set database     limits.cpu.allowance "100ms/200ms"
lxc config set metrics      limits.cpu.allowance "40ms/200ms"
lxc config set metrics      limits.cpu.priority "8"