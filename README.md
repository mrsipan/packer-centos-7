# Build qemu CentOS-7 raw/qcow2 images

Build minimal CentOS-7 `raw` or `qcow2` image that can be used in _kvm_ or _xen_.

```bash
PACKER_LOG=1 packer build -var format=raw main.json
```

In another terminal, watch the output installation:

```bash
mkfifo /tmp/qemu-serial.in /tmp/qemu-serial.out
cat /tmp/qemu-serial.out

```
