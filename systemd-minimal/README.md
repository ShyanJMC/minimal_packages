# Information

This is a minimal version of systemd based on Arch's PKGBUILD

## Known issues

1. Snapd

Maybe you will find some issues with snapd and squashfs. Just do as root;

```bash
modprobe squashfs && systemctl restart snapd.socket snapd.service snapd.failure.service 
```

then list all failed units and restart snapd's failed services or mountpoint;

```bash
systemctl list-units --failed | grep snap | cut -d' ' -f2
```
