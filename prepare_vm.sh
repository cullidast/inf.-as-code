#!/bin/bash

# Путь к образу виртуальной машины
VM_IMAGE="/var/lib/libvirt/images/node.qcow2"

# Операции для virt-sysprep
OPERATIONS_1="udev-persistent-net,ssh-hostkeys,customize"
OPERATIONS_2="bash-history,customize"
OPERATIONS_3="udev-persistent-net,customize"
OPERATIONS_4="ssh-hostkeys,udev-persistent-net"

# Выполнение virt-sysprep
sudo virt-sysprep -a "$VM_IMAGE" --operations "$OPERATIONS_1"
sudo virt-sysprep -a "$VM_IMAGE" --operations "$OPERATIONS_2"
sudo virt-sysprep -a "$VM_IMAGE" --operations "$OPERATIONS_3"
sudo virt-sysprep -a "$VM_IMAGE" --operations "$OPERATIONS_4"
