#!/usr/bin/bash

sudo apt-get install --yes\
    build-essential meson\
    vulkan-headers libvulkan-dev shaderc\
    libglm-dev libassimp-dev\
    libxcb1-dev libxcb-icccm4-dev\
    libwayland-dev wayland-protocols\
    libdrm-dev libgbm-dev
