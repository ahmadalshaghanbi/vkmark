#!/usr/bin/bash

set -ue

. /etc/os-release
wget -qO- https://packages.lunarg.com/lunarg-signing-key-pub.asc | sudo tee /etc/apt/trusted.gpg.d/lunarg.asc
sudo wget -qO "/etc/apt/sources.list.d/lunarg-vulkan-$UBUNTU_CODENAME.list" "http://packages.lunarg.com/vulkan/lunarg-vulkan-$UBUNTU_CODENAME.list"
sudo apt update
