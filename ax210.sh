#!/bin/bash

# /usr/lib/systemd/system-sleep

device=AX210
case $1 in
    pre)
        pci=$(lspci -D | grep "$device" | cut -f1 -d\ )
        echo 1 >/sys/bus/pci/devices/$pci/remove
        ;;
        
    post)
        echo 1 >/sys/bus/pci/rescan
        ;;
esac
