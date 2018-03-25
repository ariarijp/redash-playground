#!/usr/bin/env bash
set -e
docker-compose up -d postgres
docker-compose up -d
docker-compose run --rm server create_db
wget -N -P tmp http://downloads.mysql.com/docs/world.sql.gz
wget -N -P tmp http://downloads.mysql.com/docs/world_x-db.tar.gz
wget -N -P tmp http://downloads.mysql.com/docs/sakila-db.tar.gz
wget -N -P tmp http://downloads.mysql.com/docs/menagerie-db.tar.gz
wget -N -P tmp https://github.com/datacharmer/test_db/archive/master.zip
docker cp tmp/world.sql.gz redashplayground_mysql_1:/tmp
docker cp tmp/world_x-db.tar.gz redashplayground_mysql_1:/tmp
docker cp tmp/sakila-db.tar.gz redashplayground_mysql_1:/tmp
docker cp tmp/menagerie-db.tar.gz redashplayground_mysql_1:/tmp
docker cp tmp/master.zip redashplayground_mysql_1:/tmp
docker cp setup-databases.sh redashplayground_mysql_1:/tmp
docker cp setup-ds.sh redashplayground_server_1:/tmp
docker-compose exec mysql /tmp/setup-databases.sh
