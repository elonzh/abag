# need to install VcXsrv Windows X Server on Windows https://sourceforge.net/projects/vcxsrv/
# see https://techcommunity.microsoft.com/t5/windows-dev-appconsult/running-wsl-gui-apps-on-windows-10/ba-p/1493242
export DISPLAY="$(sed -n 's/nameserver //p' /etc/resolv.conf):0"
