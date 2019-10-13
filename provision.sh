#!/bin/bash -eux

# 镜像源
sudo cp -vf /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp -vf /vagrant/config/sources.list /etc/apt/sources.list
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update

# oh my zsh
sudo apt remove docker docker-engine docker.io
sudo apt install -y zsh git apt-transport-https ca-certificates curl gnupg2 software-properties-common docker-ce docker-compose fonts-powerline

wget -nv https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O zsh_install.sh
chmod +x ./zsh_install.sh
./zsh_install.sh --unattended
rm -vf ./zsh_install.sh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
sudo chsh -s "$(command -v zsh)" vagrant

# miniconda
wget -nv https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x ./Miniconda3-latest-Linux-x86_64.sh
conda_prefix="$HOME/miniconda"
./Miniconda3-latest-Linux-x86_64.sh -b -p "${conda_prefix}"
rm -v ./Miniconda3-latest-Linux-x86_64.sh

# docker, https://mirror.tuna.tsinghua.edu.cn/help/docker-ce/
sudo cp -v -f /vagrant/config/docker/daemon.json /etc/docker/daemon.json
cp -Rvf /vagrant/config/home/. ~/

conda_path="export PATH=\"${conda_prefix}/bin:\$PATH\""
echo "${conda_path}" >> ~/.bashrc
echo "${conda_path}" >> ~/.zshrc || true
