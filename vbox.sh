#!/usr/bin/env bash

function setup() {
    local name=$1;
    # create new VM
    VBoxManage createvm --name $name --ostype Ubuntu_64 --register
#     change VM params (CPU, RAM, etc)
    VBoxManage modifyvm $name --cpus 1 --memory 512 --audio none --usb off --acpi on --boot1 dvd --nic1 nat
    # create hard drive for VM
    VBoxManage createhd --filename ~/virtualbox/$name/ubuntu1604.vdi --size 10000
    # link HD to VM
    VBoxManage storagectl $name --name ide-controller --add ide;
    VBoxManage storageattach $name --storagectl ide-controller \
      --port 0 --device 0 --type hdd \
      --medium ~/virtualbox/$name/ubuntu1604.vdi;
    VBoxManage storageattach $name --storagectl ide-controller \
        --port 0 --device 1 --type dvddrive \
        --medium ./ubuntu-16.04.6-server-amd64.iso
     VBoxManage modifyvm $name --natpf1 "ssh,tcp,,2222,,22"
}

setup "master.01"
setup "master.02"
setup "master.03"
