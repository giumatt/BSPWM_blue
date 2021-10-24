#!/bin/bash

case $1 in
  start)
    sudo systemctl start libvirtd.service
    sudo virsh net-start default
    echo "Virtualizzazione attiva."
    ;;
  stop)
    sudo systemctl stop libvirtd.service
    echo "Virtualizzazione non attiva."
    ;;
  *)
    echo "Riprova. Usa start per avviare la virtualizzazione o stop per stopparla."
    ;;
esac
