#!/bin/bash

sudo docker run \
-v /var/mH-PriSe/mysql:/var/lib/mysql \
-v /var/mH-PriSe/data:/mnt/data \
-v `pwd`/conf/:/usr/src/app/config \
-v `pwd`/mH-PriSe-light:/usr/src/app/framework \
-v $HOME/.Xauthority:/home/rlogin/.Xauthority \
-t \
-i \
-ti \
--rm \
-e DISPLAY=$DISPLAY \
-e INTERFACE=wlp58s0 \
-e OUTGOINGS=enp0s20f0u2 \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-p 3306:3306 \
-p 22:22 \
--privileged \
--net host \
--name mh-prise \
martin/test:v1
