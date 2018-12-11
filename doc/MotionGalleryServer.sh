# username password
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
python3 /home/pi/MotionGalleryServer.py \
	$(awk '{print $1}' /etc/motion/MotionGalleryServer.conf) \
	$(awk '{print $2}' /etc/motion/MotionGalleryServer.conf) \
	0.0.0.0 8000 \
	--dir /home/pi/motion/
 
