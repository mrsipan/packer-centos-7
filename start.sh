#!/usr/bin/env dash

disk_path=$1

qemu-system-x86_64 \
  -m 512 \
  -vga virtio \
  -display "default,show-cursor=on" \
  -usb \
  -device usb-tablet \
  -drive "format=raw,file=${disk_path},if=virtio" \
  -accel hvf \
  -netdev user,id=mynet0 -device rtl8139,netdev=mynet0 \
  -cpu host
