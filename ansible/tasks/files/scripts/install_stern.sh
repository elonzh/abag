#!/usr/bin/env bash
set -eu
OS="$(uname | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')"
url="https://github.com/wercker/stern/releases/latest/download/stern_${OS}_${ARCH}"
wget --continue --timestamping -O ~/bin/stern "${url}"
chmod +x ~/bin/stern
