#!/bin/bash -e

createdb() {
  sudo docker exec service_mysql_1 mysql -u root -ptoor333666 -e "create database $1 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
}

case "$1" in
createdb) createdb $2 ;;
*)
  echo "Usage:"
  echo "createdb [db_name]"
  exit 1
  ;;
esac
