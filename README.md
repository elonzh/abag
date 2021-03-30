# A bag 🗳

> once build, code everywhere.

自动化开发环境配置工具，基于 Ubuntu 发行版，支持 WSL2, Vagrant 及常规服务器/桌面版部署

## 功能

1. 代理及终端配置
2. go 语言环境配置
3. python 语言环境配置
4. 前端环境配置
5. docker, kubernetes 环境配置
6. 常见软件安装

## 使用

### Vagrant

1. [安装 Vagrant](https://www.vagrantup.com/docs/installation/)
2. [可选]配置你的虚拟机选项(`cp config.sample.yml config.yml`)
3. `vagrant up`

### Windows WSL

1. [启用 WSL2](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
2. [安装 Ubuntu WSL 发行版](https://www.microsoft.com/zh-cn/p/ubuntu/9nblggh4msv6)
3. 进入 Ubuntu, 切换到本项目目录
4. 执行 `./scripts/wsl.sh`

## 配置

参考 [ansible 文档](https://docs.ansible.com/ansible/2.9/index.html) 修改 `ansible` 目录下相关文件

## TODO

1. 支持覆盖配置文件而不是在原有基础上修改
