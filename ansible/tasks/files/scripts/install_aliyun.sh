#!/usr/bin/env bash
set -eux
OS="$(uname | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')"
url="https://aliyuncli.alicdn.com/aliyun-cli-${OS}-latest-${ARCH}.tgz"
file="/tmp/$(basename ${url})"
wget --continue --timestamping -O "${file}" "${url}"
tar zxvf "${file}" --directory="/tmp"
mv "/tmp/aliyun" ~/bin
~/bin/aliyun auto-completion
