#!/bin/bash

echo "Installing LidarView ..."

echo "Installing dependencies ..."

sudo apt update

sudo apt install -y qtcreator qtbase5-dev qt5-qmake cmake
sudo apt install -y libqt5svg5-dev
sudo apt-get install -y qtmultimedia5-dev
sudo apt install -y byacc
sudo apt install -y bison
sudo apt-get install -y flax
sudo apt install -y libpcap-dev
sudo apt install -y libnl-3-dev libnl-genl-3-dev 

git clone --recursive https://gitlab.kitware.com/LidarView/lidarview-superbuild.git lvsb

cd lvsb

mkdir build && cd build

cmake ../ -DCMAKE_BUILD_TYPE=Release -DENABLE_slam=True -DUSE_SYSTEM_qt5=ON -DENABLE_pdal=ON

cmake --build .