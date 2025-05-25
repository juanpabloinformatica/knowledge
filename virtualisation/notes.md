# Virtualisation

## What is

Software that simulate hardware

## Notes

Qemu popular vm in linux

## Usage

### Creating disk

- For creating disk
-

```
qemu-img create -f qcow2 HDA.img 10G
```

- -f --> stands for format
- qcow2 --> Is a format for file disk that qemu understand
- HDA.img --> image name
- 10G --> image capacity

### Creating vm

```
qemu-system-x86_64 -cdrom ~/Downloads/isos/archlinux-2024.12.01-x86_64.iso -boot d -cpu host -enable-kvm -smp 2 -m 2G
```

This is telling qemu to create a virtual machine with the following hardware capacities

- -cdrom --> will have embedded the image
- -boot --> will have the way of booting in this case is a disk instead of the hardisk
- -cpu --> tells if taking or not host hardware capabilities is setted as host
  host architecture must be the same that the vm's
- -enable-kvm --> This allow to have accelerator so quicker performance
- -smp --> Assign number of cpus assigned to the vm
- -m --> Assign RAM capacity of the vm
