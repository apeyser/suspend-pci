#!/bin/bash

# /usr/lib/systemd/system-sleep

pre() {
    local -a devices
    readarray -t devices < <(</etc/suspend-pci.conf)
    local device
    for device in "${devices[@]}"; do
        # Filter out empty & comment lines
        ! [[ $device =~ ^[[:space:]]*(#.*)?$ ]] || continue
        # Read the matching device and remove
        local pci=$(lspci -D | grep "$device" | cut -f1 -d\ )
        echo 1 >/sys/bus/pci/devices/$pci/remove
    done
}

post() {
    echo 1 >/sys/bus/pci/rescan
}

case "$1" in
    pre) pre;;
    post) post;;
esac
