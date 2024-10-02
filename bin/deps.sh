#!/usr/bin/sudo bash

# Add ubuntu to sudoers
echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# OpenSSH
sudo apt install openssh-server
sudo systemctl status sshd

# Permit root login
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd