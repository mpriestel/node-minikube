#!/bin/bash

# Only run this scripts if you don't have Minikube installed
# Run this script as root - sudo bash install_minikube.sh

apt update -y
apt upgrade -y
apt install -y curl wget apt-transport-https
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
echo "Installed minikube version: $(minikube version)"