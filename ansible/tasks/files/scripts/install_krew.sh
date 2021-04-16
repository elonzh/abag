#!/usr/bin/env bash
set -eu
OS="$(uname | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')"
url="https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz"
file="/tmp/$(basename ${url})"
wget --continue --timestamping -O "${file}" "${url}"
tar zxvf "${file}" --directory="/tmp"
KREW="/tmp/krew-${OS}_${ARCH}"
"$KREW" install krew
rm -vf /tmp/krew-*
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
kubectl krew install view-secret
