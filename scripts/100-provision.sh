#!/bin/bash -eux

echo "start provision by $(whoami) at $(pwd)"

# FIXME: zsh installed but can not found when first run
# apt list | grep -E 'zsh|docker|git'

echo "start setup zsh, zsh at $(command -v zsh)"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
sudo chsh -s "$(command -v zsh)" vagrant

echo "start install miniconda"
wget -nv https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x ./Miniconda3-latest-Linux-x86_64.sh
conda_prefix="$HOME/miniconda"
./Miniconda3-latest-Linux-x86_64.sh -b -p "${conda_prefix}"
rm -v ./Miniconda3-latest-Linux-x86_64.sh

echo "start copy configs"
cp -Rvf /vagrant/config/home/. ~/
