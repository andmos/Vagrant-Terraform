#!/usr/bin/env bash

sudo apt-get install jq unzip

# Get URLs for most recent versions
terraform_url=$(curl --silent https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*64" | sort -rh | head -1 | awk -F[\"] '{print $4}')

# Create a move into directory.
cd ~/
mkdir terraform && cd $_

# Download Terraform. URI: https://www.terraform.io/downloads.html
curl -o terraform.zip $terraform_url
# Unzip and install
unzip terraform.zip

echo '
# Terraform & Packer Paths.
export PATH=~/terraform/:$PATH
' >>~/.bash_profile

source ~/.bash_profile
