# A bag

once build, code every where.

# Features

1. docker, docker-compose support(with default service mysql, redis)
2. preconfigured zsh
3. miniconda3
4. mirrors and proxy  
5. builtin tools(createdb)

# Usage

## Install Vagrant

https://www.vagrantup.com/docs/installation/

## Add box

```shell script
vagrant box add --name "ubuntu/bionic64" https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/bionic/current/bionic-server-cloudimg-amd64-vagrant.box
```

## Create your config (optional)

```shell script
cp config.yml.sample config.yml
```

## UP!

```shell script
vagrant up
```


# Reference

- [vagrant](https://www.vagrantup.com/docs/)
