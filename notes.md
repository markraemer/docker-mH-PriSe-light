##Admin
delete all untagged images `sudo docker rmi -f $(sudo docker images | grep "^<none>" | awk '{print $3}')`

# Activity Log
* 16/12/2016 - hotspot.sh file working
* 17/12/2016 - added python and pip with requirements.txt
* 22/12/2016 - python menu comming up / mysql running, android tools installed
* 16/01/2017 - reducing to docker light; working on sshd daemon
* 20/01/2017 - removed delete trigger for security reasons


# temp
## UDF to delete directories
http://bernardodamele.blogspot.co.uk/2009/01/command-execution-with-mysql-udf.html
https://github.com/mysqludf/lib_mysqludf_sys#readme

`gcc -m64 -fPIC -Wall -I/usr/include/mysql -I. -shared lib_mysqludf_sys.c -o /usr/lib/mysql/plugin/lib_mysqludf_sys.so -L/usr/lib/x86_64-linux-gnu/libstdc++.so.6`
