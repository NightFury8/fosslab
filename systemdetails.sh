#!/bin/bash

echo -e "Kernel and operating system information: $(uname -a) \n"
echo -e "cpu info: $(lscpu) \n"
echo -e "pci devices info: $(lspci) \n"
echo -e "mounted usb devices: $(lsusb) \n"
echo -e "memmory and swap usage details: $(free -h) \n"
echo -e "list bulk storage devices: $(lsblk) \n"
echo -e "currently loaded kernel modules: $(lsmod) \n"
echo -e "uptime: $(uptime) \n"
echo -e "installed shells: $(echo /etc/shells) \n"

