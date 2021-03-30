#!/usr/bin/env bash
set -e
SCRIPT_ROOT="$(realpath "$(dirname "${BASH_SOURCE}")")"

"${SCRIPT_ROOT}/set_apt_mirror.sh"
"${SCRIPT_ROOT}/install_ansible.sh"
ansible-playbook -k -v "ansible/wsl.yml"
