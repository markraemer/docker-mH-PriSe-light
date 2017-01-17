#!/bin/bash

FILE=""
DIR="/var/lib/mysql"
# init
# look for empty dir

if [ "$(ls -A $DIR)" ]; then
     echo "Take action $DIR is not Empty"
     echo "Seems like MySQL has been set up already"
else
    echo "$DIR is Empty"
    echo "setting up MySQL"
    mysql_install_db
    echo "starting database"
    /usr/bin/mysqld_safe > /dev/null 2>&1 &
    sleep 5
    mysql -e "set password=PASSWORD('root')"
    mysql -uroot -proot < /mnt/data/data/mysql_dump.sql
    echo "shutting down database"
    mysqladmin -uroot -proot shutdown
fi

# chown -R mysql:staff /var/run/mysqld
# chmod -R 770 /var/run/mysqld
