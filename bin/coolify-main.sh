#!/bin/bash

# Define the cloud.cfg path
CLOUD_CFG="/etc/cloud/cloud.cfg"

# Modify disable_root to allow root login
sudo sed -i 's/^disable_root: true/disable_root: false/' $CLOUD_CFG

# Ensure ssh_pwauth is enabled
if grep -q "^ssh_pwauth" $CLOUD_CFG; then
    sudo sed -i 's/^ssh_pwauth: .*/ssh_pwauth: true/' $CLOUD_CFG
else
    echo "ssh_pwauth: true" | sudo tee -a $CLOUD_CFG
fi

# Add ubuntu to sudoers
echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# OpenSSH
apt install openssh-server
systemctl status sshd

# Permit root login
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
systemctl restart sshd

# Install Coolify
curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash