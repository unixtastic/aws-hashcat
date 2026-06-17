#!/bin/bash

keyring=cuda-keyring_1.1-1_all.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2604/x86_64/${keyring} -O /tmp/${keyring}
dpkg -i /tmp/${keyring}

add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2604/x86_64/ /"
apt-get update -y
apt-get -y install cuda

apt-get clean all
