#!/bin/bash

# /usr/lib/systemd/system-sleep

pre() {
    local -a devices
    readarray -t devices < <(</etc/suspend-pci.conf)
    local device
    for device in "${devices[@]}"; do
        if [[ $device =~ ^[[:space:]]*(#.*)?$ ]]; then
            continue
        fi

        local pci=$(lspci -D | grep "$device" | cut -f1 -d\ )
        echo 1 >/sys/bus/pci/$pci/remove
    done
}

post() {
    echo 1 >/sys/bus/pci/rescan
}

case "$1" in
    pre) pre;;
    post) post;;
esac
