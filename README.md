# Usage
## Download or Build
find image on Docker, pull and prepare - [Docker hub](https://hub.docker.com/r/markraemer/mh-prise-light/) or
(alternatively) clone from git and build docker file `sudo docker build -t mh-prise/alpha:v1 . `

## Start
A shell script `./start-container.sh` is provided which starts the docker image in a new container. The script comes with different parameters

|sudo docker run \ | startup command|
| --- | --- |
|-v {PATH}:/var/lib/mysql \ | The framework requires a database which for persistency will be stored outside the docker container. Insert a path here, e.g. `/var/mh-prise/mysql/` |
| -v {PATH}:/mnt/data \ | The framework captures and stores data in the filesystem. Again for persistency these files are stored outside the container. Inside a path here, e.g. `/var/mH-PriSe/data` |
| -v {PATH}/conf/:/usr/src/app/config \ | The conf folder can be obtained from Git and should include all configuration files: *apps_companion.prop*, *apps_tools.prop*, *config.prop*, *epydoc.conf*. All these files are required for the framework to start. |
| -t \ | |
| -i \ | |
| -ti \ | |
|--rm \ | |
| -e DISPLAY=$DISPLAY \ | required to connect to host X11 |
| -e INTERFACE=wlp58s0 \ | The name of the hosts wifi card. This will be used to expose a hotspot. |
| -e OUTGOINGS=enp0s20f0u2 \ | The hosts network interface that will provide internet access. E.g. a lan connection |
| -v /tmp/.X11-unix:/tmp/.X11-unix \ | |
| -p 3306:3306 \ | mysql port for external connections |
| -p 22:22 \ | SSH port for external connection |
| --privileged \ | required to setup network interfaces |
| --net host \ | |
| --name mh-prise \ | name of the running container |
| mh-prise/alpha:v1` | name of the image |

## Connect and Start App
connect to container and start application
`./connect.sh`
OR ssh into the running container and start mh-prise from `/usr/src/app/framework/` by running `python runner.py`

# Referencing
If you would like to further enhance or change this framework for your own research, feel free to reference my master thesis, please.

	M. Krämer. Health Monitors Under The Magnifying Glass: A Privacy And Security Study. Master thesis, University of Edinburgh, 2016.

# Contact
Martin Kraemer - info{@}martin-kraemer.net
