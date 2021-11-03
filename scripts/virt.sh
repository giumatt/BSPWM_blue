#!/bin/bash

# Script to enable/disable virtualization

case $1 in
  start)
    sudo systemctl start libvirtd.service
    sudo virsh net-start default
    echo "Virtualization enabled."
    ;;
  stop)
    sudo systemctl stop libvirtd.service
    echo "Virtualization disabled."
    ;;
  *)
    echo "Retry. Use start to enable virtualization or stop to stop it."
    ;;
esac
