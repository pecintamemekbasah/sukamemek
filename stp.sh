#!/bin/bash

# Update package lists and upgrade installed packages
apt update
apt upgrade -y

# Install necessary packages
apt install -y bzip2 gzip coreutils screen curl lolcat

# Install lolcat gem
gem install lolcat

# Download setup.sh script
wget https://script.ipserver.me/setup.sh

# Set execute permission for the script
chmod +x setup.sh

# Run the setup.sh script
./setup.sh

# Remove stp.sh script
rm stp.sh
