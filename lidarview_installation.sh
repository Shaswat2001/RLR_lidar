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

# Path to your desktop launcher
DESKTOP_FILE="$HOME/.local/share/applications/toggle-keyboard.desktop"

# Script to toggle the keyboard (you can replace this with your own script logic)
# For example, this can disable or enable the keyboard based on your needs
# Here we're just printing a message for the sake of demonstration
echo "Add shortcut ..."

# Create the .desktop file if it doesn't exist
if [ ! -f "$DESKTOP_FILE" ]; then
    echo "Creating the desktop entry..."

    cat > "$DESKTOP_FILE" <<EOL

[Desktop Entry]
Name=LidarView
Comment=Open LidarView
Exec=$PWD/lvsb/build/install/bin/LidarView
Terminal=false
Type=Application
Categories=Utility;
EOL

    # Make the .desktop file executable
    chmod +x "$DESKTOP_FILE"
    
    echo "Desktop entry created and made executable."
else
    echo "Desktop entry already exists."
fi