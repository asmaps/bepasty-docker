# bepasty-docker

Docker automated build repository for the [bepasty server](https://github.com/bepasty/bepasty-server)

## Usage

Install docker on your system. for the restart feature you need at least docker 1.2.
[Instructions](http://docs.docker.com/installation/)


**First start/"setup"**

This fetches the image (if you haven't already done that) and creates a container.
```
docker run -d --restart=always --name bepasty -p 127.0.0.1:5000:5000 -v /opt/bepasty:/srv/bepasty asmaps/bepasty
```
After startup you should have the config file located in /opt/bepasty/bepasty.conf  
Adjust it to your needs and restart the server.

**Stop the server**

```
docker stop bepasty
```

**Start the server**

With the --restart=always option the server should be started automatically. If you stopped it you can start it again by
running
```
docker start bepasty
```

**Updating**

To update you need to stop and delete the container (data is stored on the host, so it shouldn't be lost), then fetch
the new image and recreate the container:
```
docker stop bepasty
docker rm bepasty
docker pull asmaps/bepasty
docker run -d --restart=always --name bepasty -p 127.0.0.1:5000:5000 -v /opt/bepasty:/srv/bepasty asmaps/bepasty
```
