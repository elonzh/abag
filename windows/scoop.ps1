Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop config proxy 127.0.0.1:7890
scoop bucket add extras
scoop install `
    authy `
    coreutils `
    fzf `
    gettext `
    git `
    helm `
    hugo `
    kubectl `
    make `
    miniconda3 `
    starship `
    stern `
    tldr `
    vagrant `
    yarn `
    z.lua
