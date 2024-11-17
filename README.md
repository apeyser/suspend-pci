== Remove pci devices before suspend, rescan afterward

For ` Wi-Fi 6E(802.11ax) AX210/AX1675* 2x2 [Typhoon Peak]`, 
the device needs to be removed from the pci bus before suspends.

For `/etc/suspend-pci.conf`:
```
Intel Corporation Wi-Fi 6E(802.11ax) AX210/AX1675*
```
will let suspend/resume on systemd with TongFang GM6IX8B work

=== /etc/suspend-pci.conf

The conf file should be filled with unique `grep` strings from `lscpi -D`; 
each line is tested against the output with `grep` and the first field is 
`cut` as the pci-bus address used to remove the device.

=== pacman

This is an arch PKGBUILD directory (`makepkg -si`)
