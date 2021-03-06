# Motion Gallery Server

A simple web server for serving Motion snapshots:

![A day gallery](imgs/motion_day_gallery.gif)

### What's Motion
Motion is a light weight but complete surveillance server. It can be found [here](https://motion-project.github.io/).
 
### Motion installation

First of all you have to follow a tutorial for basic installation and configuration.

I'm using a RaspberryPI that need only:

	sudo apt install motion
	
### Motion configuration

I use a webcam that take a snapshot when a motion is detected.

The most important configuration parameters are:

	target_dir /home/pi/motion

	picture_filename %Y%m%d/%H%M%S-%q
	
that sets the base directory and **create a sub directory for every day** where put the snapshots.

In [doc/motion-4.0.conf](doc/motion-4.0.conf) cand find more detailed parameters.

### Install Motion Gallery Server

- install base python modules
```bash
(sudo -H) pip3 install simple-http-server
(sudo -H) pip3 install click
```
	 
- create a directory for your server or use **/var/motion**
in my case I used **/home/pi/motion**
- download Motion Gallery Server
	wget [https://raw.githubusercontent.com/zonafets/MotionGalleryServer/master/src/MotionGalleryServer.py](https://raw.githubusercontent.com/zonafets/MotionGalleryServer/master/src/MotionGalleryServer.py)
- download Motion Gallery web-app client
	wget [https://raw.githubusercontent.com/zonafets/MotionGalleryServer/master/index.html](https://raw.githubusercontent.com/zonafets/src/MotionGalleryServer/master/src/index.html)
- give it permissions for user motion with chown/chgrp	

### Configure Motion Gallery Server
You need three steps:

1. create the bash script that run the python server from the directory of shapshots
(an example in [src/MotionGalleryServer.sh](src/MotionGalleryServer.sh)
this uses a config file in /etc/ for username/password)
2. create a crontab task that run the server on boot
```bash
@reboot	/home/pi/MotionGalleryServer.sh
```
I used this command to simplify and test:
```bash
sudo runuser -l motion -s "/bin/bash"
```

### Interface usage

button/element|event|action
----|-------|--------------
URL hash|#YYYYMMDD|show snapshots of specific date
prev.day|click|show previous day snapshots
next.day|click|show next day snapshots
today|click|go to today snapshots
+|click|increase size of thumbnails
-|click|decrease size of thumbnails
thumbnail|click|select/unselect
thumbnail|dbl.click|open zoomed image
zoomed thumbnail|click|close zoomed image
remove selected|click|delete on server and client the selected thumbnails
remove (UN)selected|click|delete on server and client the thumbnails not selected


### Todo
1. manage the get of resized images for mobile/low band devices/networks
2. limitis delete of JPG only to allow server & client programs to stay in the same folder
3. avoid use of JQuery
4. use the Motion web server

