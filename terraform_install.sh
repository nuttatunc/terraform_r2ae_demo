#!/bin/bash
sudo apt -y update && sudo apt -y upgrade
sudo wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
sudo unzip ./terraform_0.12.24_linux_amd64.zip
export PATH=$PATH:$pwd
