#!/usr/bin/env bash
set -e
export MYSQL_PWD=playground
./manage.py ds new --type mysql --options "{\"db\": \"world\", \"host\": \"mysql\", \"passwd\": \"$MYSQL_PWD\", \"user\": \"root\"}" mysql_world
./manage.py ds new --type mysql --options "{\"db\": \"world_x\", \"host\": \"mysql\", \"passwd\": \"$MYSQL_PWD\", \"user\": \"root\"}" mysql_world_x
./manage.py ds new --type mysql --options "{\"db\": \"sakila\", \"host\": \"mysql\", \"passwd\": \"$MYSQL_PWD\", \"user\": \"root\"}" mysql_sakila
./manage.py ds new --type mysql --options "{\"db\": \"menagerie\", \"host\": \"mysql\", \"passwd\": \"$MYSQL_PWD\", \"user\": \"root\"}" mysql_menagerie