#!/bin/bash

# Создание нового образа жесткого диска
sudo qemu-img create -f qcow2 -o preallocation=metadata /var/lib/libvirt/images/node.qcow2 20G

# Установка виртуальной машины
sudo virt-install \
  --connect=qemu:///system \
  --virt-type=kvm \
  --accelerate \
  --hvm \
  --vcpus=2 \
  --ram=8192 \
  --video=cirrus \
  --graphics vnc,listen=0.0.0.0,password= \
  --noautoconsole \
  --network network=mynetwork,model=virtio \
  --network network=mynetwork,model=virtio \
  --os-variant=ubuntu20.04 \
  --boot hd,cdrom,menu=on \
  --disk device=disk,bus=virtio,cache=none,format=qcow2,path=/var/lib/libvirt/images/node.qcow2 \
  --cdrom /home/evgen/ubuntu-22.04.3-live-server-amd64.iso \
  --name=node
