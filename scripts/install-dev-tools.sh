#!/bin/bash

apt-get update && apt upgrade -y

echo "Installing dev tools..."
curl -LO https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl && mv kubectl /usr/local/bin/kubectl

apt install -y zsh

pip install poetry

