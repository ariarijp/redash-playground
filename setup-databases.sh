#!/usr/bin/env bash
set -e
export MYSQL_PWD=playground
apt update && apt install -y unzip
cd /tmp
tar xf world_x-db.tar.gz
tar xf sakila-db.tar.gz
tar xf menagerie-db.tar.gz
unzip master.zip
zcat world.sql.gz | mysql -uroot
mysql < /tmp/world_x-db/world_x.sql
mysql < /tmp/sakila-db/sakila-schema.sql
mysql < /tmp/sakila-db/sakila-data.sql
mysql -e "DROP DATABASE IF EXISTS menagerie;"
mysql -e "CREATE DATABASE menagerie;"
mysql menagerie < /tmp/menagerie-db/cr_pet_tbl.sql
mysql menagerie < /tmp/menagerie-db/ins_puff_rec.sql
mysql menagerie < /tmp/menagerie-db/cr_event_tbl.sql
mysqlimport --local menagerie /tmp/menagerie-db/pet.txt
mysqlimport --local menagerie /tmp/menagerie-db/event.txt
cd test_db-master
mysql < employees.sql
