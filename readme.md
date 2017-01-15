#Running
commit changes to image
`sudo docker commit 2df4063c022d martin/test:v1`

starting up containers
`sudo docker-compose up`

connecting to a running container
`sudo docker exec -ti dockermhprise_mhprise_1 /bin/bash`

run docker image `sudo docker run -t -e INTERFACE=wlp58s0 -e OUTGOINGS=enp0s20f0u2 --privileged --net host -i martin/test:v1`

build docker file `sudo docker build -t martin/test:v1 . `

delete all untagged images `sudo docker rmi -f $(sudo docker images | grep "^<none>" | awk '{print $3}')`

# Activity Log
* 16/12/2016 - hotspot.sh file working
* 17/12/2016 - added python and pip with requirements.txt
* 22/12/2016 - python menu comming up / mysql running, android tools installed

# ToDo
*This is likely to create a new tool rather then a Docker version of the framework.*
* check for unix helper tools such as nano, unzip, tar ...
* install missing software dependencies
    * Apache, PHP
    * Androguard, Mallodroid, Drozer, apktool, dex2jar
    * Wireshark/tShark
    * googleplay-api
* change to non-gui portable version/ dependencies to Vysor etc. must be avoided
* make mH-PriSe folder and configuration settings available externally
