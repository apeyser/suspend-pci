#!/bin/bash
# -*- mode: Shell-script; sh_shell: "bash"; tab-width: 2; -*-

# Goes into
# /usr/lib/systemd/system-sleep/suspend-pci
# Reads /etc/suspend-pci line by line for devices to `remove`

pre() {
  # read /etc/suspend-pci.conf
  local -a devices
  readarray -t devices </etc/suspend-pci.conf
  # remove each device associated with conf file line
  local device
  for device in "${devices[@]}"; do
    # Filter out empty & comment lines
    ! [[ $device =~ ^[[:space:]]*(#.*)?$ ]] ||
      continue
    # Read the matching device and remove
    local pci=$(lspci -D | grep -F "$device" | cut -f1 -d\ )
    echo 1 >/sys/bus/pci/devices/$pci/remove
  done
}

post() {
  # rescan the bus for all removed pci devices
  echo 1 >/sys/bus/pci/rescan
}

case "$1" in
  pre)  pre;;
  post) post;;
esac
