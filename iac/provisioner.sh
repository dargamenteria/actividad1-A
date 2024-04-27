#!/bin/bash
#

sudo resolvectl dns ens3 1.1.1.1
sudo hostnamectl hostname docker.paranoidworld.es

sudo apt-get install cloud-guest-utils
sudo growpart /dev/vda 1
sudo apt-get update
sudo apt-get install ca-certificates curl
