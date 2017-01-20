#Running
commit changes to image
`sudo docker commit 2df4063c022d martin/test:v1`

starting up containers
`sudo docker-compose up`

connecting to a running container
`sudo docker exec -ti dockermhprise_mhprise_1 /bin/bash`

run docker image `sudo docker run -t -e INTERFACE=wlp58s0 -e OUTGOINGS=enp0s20f0u2 --privileged --net host -i martin/test:v1`

sudo docker run \\\
  -v /var/mH-PriSe/mysql:/var/lib/mysql \\\
  -v /var/mH-PriSe/data:/mnt/data \\\
  -v /home/martin/repos/docker-mhPrise/conf/:/usr/src/app/config \\\
  -v /home/martin/repos/docker-mhPrise/mH-PriSe-light:/usr/src/app/framework \\\
  -t \\\
  -i \\\
  -ti \\\
  -\-rm \\\
  -e DISPLAY=$DISPLAY \\\
  -e INTERFACE=wlp58s0 \\\
  -e OUTGOINGS=enp0s20f0u2 \\\
  -v /tmp/.X11-unix:/tmp/.X11-unix \\\
  -p 3306:3306 \\\
  -p 22:22 \\\
  --privileged \\\
  --net host \\\
  martin/test:v1

build docker file `sudo docker build -t martin/test:v1 . `

delete all untagged images `sudo docker rmi -f $(sudo docker images | grep "^<none>" | awk '{print $3}')`

# Activity Log
* 16/12/2016 - hotspot.sh file working
* 17/12/2016 - added python and pip with requirements.txt
* 22/12/2016 - python menu comming up / mysql running, android tools installed
* 16/01/2017 - reducing to docker light; working on sshd daemon
* 20/01/2017 - removed delete trigger for security reasons

# ToDo
*This is likely to create a new tool rather then a Docker version of the framework.*
* check for unix helper tools such as nano, unzip, tar ...
* remove tools and strip down to dynamic testing, traffic analysis and helper
* use SSH to access container; set up sshd in container;#
* run script after login to set environment variables / or check if properly set anyway

# temp
## UDF to delete directories
http://bernardodamele.blogspot.co.uk/2009/01/command-execution-with-mysql-udf.html
https://github.com/mysqludf/lib_mysqludf_sys#readme

`gcc -m64 -fPIC -Wall -I/usr/include/mysql -I. -shared lib_mysqludf_sys.c -o /usr/lib/mysql/plugin/lib_mysqludf_sys.so -L/usr/lib/x86_64-linux-gnu/libstdc++.so.6`
