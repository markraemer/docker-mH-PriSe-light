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
    # setting up database
    mysql -uroot -proot < /usr/src/app/example_data/sql/mhprise.sql
    # setting up meta data for phpmyadmin
    gzip -d /usr/share/doc/phpmyadmin/examples/create_tables.sql.gz
    mysql -uroot -proot < /usr/share/doc/phpmyadmin/examples/create_tables.sql
    echo "shutting down database"
    mysqladmin -uroot -proot shutdown
fi

DIR="/mnt/data"
if [ "$(ls -A $DIR)" ]; then
     echo "Take action $DIR is not Empty"
     echo "Seems like Example Data has been set up already"
else
    echo "$DIR is Empty"
    echo "copying sample data"
    cp -R example_data/experiments /mnt/data/experiments
    cp -R example_data/apps /mnt/data/apps
    cp -R example_data/tools /mnt/data/tools
    echo "all data prepared"
fi



# chown -R mysql:staff /var/run/mysqld
# chmod -R 770 /var/run/mysqld
