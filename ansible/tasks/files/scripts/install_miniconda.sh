#!/usr/bin/env bash
set -eux
url="https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh"
file="/tmp/$(basename ${url})"
wget --continue --timestamping -O "${file}" "${url}"
chmod +x "${file}"
conda_prefix="$HOME/miniconda"
"${file}" -b -u -p "${conda_prefix}"
"${conda_prefix}/bin/conda" init bash zsh
