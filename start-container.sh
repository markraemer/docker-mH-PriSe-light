#!/bin/bash

sudo docker run \
-v /var/mH-PriSe/mysql:/var/lib/mysql \
-v /var/mH-PriSe/data:/mnt/data \
-v /home/martin/repos/docker-mhPrise/conf/:/usr/src/app/config \
-v /home/martin/repos/docker-mhPrise/mH-PriSe-light:/usr/src/app/framework \
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
martin/test:v1
