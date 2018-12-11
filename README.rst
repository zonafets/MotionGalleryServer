# Motion Gallery Server

A simple web server for serving Motion snapshots:

![A day gallery](imgs/motion_day_gallery.gif

### What's Motion
Motion is a light weight surveillance server that can be found [here](https://motion-project.github.io/).
 
### Motion installation

First of all you have to follow a tutorial for basic installation and configuration.

I'm using a RaspberryPI that need only a classic:

	sudo apt install motion
	
### Motion configuration

I use a webcam that take a snapshot when a motion is detected.

The most important configuration parameters are:

	target_dir /home/pi/motion

	picture_filename %Y%m%d/%H%M%S-%q
	
that sets the base directory and **create a sub directory for every day** where put the snapshots.

In [doc/motion-4.0.conf](doc/motion-4.0.conf) there are more parameters.

### Install Motion Gallery Server

- install base python modules
```bash
(sudo -H) pip3 install simple-http-server
(sudo -H) pip3 install click
```
	 
- create a directory for your server or use /var/motion
- download Motion Gallery Server
- give permissions to user motion with chown/chgrp	

### Configure Motion Gallery Server
You need three steps:

1. create the bash script that run the python server from the directory of shapshots
can find an example in [doc/MotionGalleryServer.sh](doc/MotionGalleryServer.sh)
2. create a crontab task that run the server on boot
```bash
@reboot	/home/pi/MotionGalleryServer.sh
```
