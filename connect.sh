#!/bin/bash
xhost local:root
sudo docker exec -ti mh-prise /bin/bash -c 'cd /usr/src/app/framework/ && python runner.py'
