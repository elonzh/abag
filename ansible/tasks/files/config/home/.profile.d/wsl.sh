# [How to access host ip and port? · Issue #1032 · microsoft/WSL](https://github.com/Microsoft/WSL/issues/1032)
export WSL_WINDOWS_HOST=$(grep nameserver /etc/resolv.conf | cut -d ' ' -f 2)
