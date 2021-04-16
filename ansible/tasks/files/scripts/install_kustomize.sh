#!/usr/bin/env bash
set -eu
rm -f ~/bin/kustomize
bash -c "$(curl -fsSL https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh)" "" ~/bin
