#!/bin/bash

new_password=`< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c12`
#check if uid=0
if [ "$(id -u)" != "0" ]; then
   echo "run it as root / use sudo " 1>&2
   exit 1
fi

#stop mysql 
/etc/init.d/mysql stop

#run it again with  --skip-grant-tables
/usr/bin/mysqld_safe  --skip-grant-tables > /dev/null 2>&1 &
sleep 3

#change the root password 
mysql -uroot mysql -e "UPDATE mysql.user SET Password=PASSWORD('$new_password') WHERE User='root';"

#shtudown mysql
/usr/bin/mysqladmin shutdown

#start again 
/etc/init.d/mysql start

echo "your new password is : $new_password"

