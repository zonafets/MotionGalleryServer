pylint:
	pylint SimpleHTTPAuthServer | less

server: cert.pem
	python -m SimpleHTTPAuthServer 9009 user:pass

cert.pem:
	echo "Enter random data"
	openssl req -newkey rsa:2048 -new -nodes -keyout key.pem -out cert.pem
