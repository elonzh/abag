#!/usr/bin/env bash

mirror="http://mirrors.aliyun.com"
sudo sed -i "s@http://.*archive.ubuntu.com@${mirror}@g" /etc/apt/sources.list
sudo sed -i "s@http://.*security.ubuntu.com@${mirror}@g" /etc/apt/sources.list
sudo apt update
