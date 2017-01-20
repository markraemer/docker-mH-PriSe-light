#Running
build docker file `sudo docker build -t mh-prise/alpha:v1 . `

run image in container `./start-container.sh`

connecting to a running container
`sudo docker exec -ti mh-prise "/bin/bash"`

start mh-prise from `/usr/src/app/framework/` by running `python runner.py`
