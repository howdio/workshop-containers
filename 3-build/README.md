# Build Docker images
Ok, we understand that the container images are immutable and that we have to build them up in layers. This lab explains how to create your own images easily using a Dockerfile.

## 1 - Download the workshop
For this lab we need to download the repository which contains the presentation. To do this, we will clone the Git repository on your local machine.
~~~sh
git clone https://github.com/howdio/workshop-containers
cd workshop-container
~~~

## 2 - Prepare Dockerfile
There is already a Dockerfile
~~~sh
cp ./3-build/Dockerfile ./presentation/
cat ./presentation/Dockerfile
~~~

The Dockerfile contains the instructions on how to build an image. Each statement represents basicly a layer, which we know by now, are immutable. `FROM nginx` tells Docker that you would like to build upon the base NGINX image. `COPY . /usr/share/nginx/html` will copy all files in the current folder to a target folder inside the container. Although it's not in this example, but `RUN apt-get install nginx` will execute commands inside the image. 

> Note: [https://hub.docker.com](https://hub.docker.com) contains a public repository with all kind of prebaked images for you to use. You can also host your own images.

## 3 - Build image
With the `docker build` command we can build the image using the Dockerfile located in the specific folder. The `-t` parameter specifies the tag it will beused for the image.

~~~sh
docker build -t workshop ./presentation
docker image ls
~~~

## 4 - Run container
Now we have build the image we can use it to run the container image. Because NGINX is running inside the container as image we don't want it block us out the terminal. We can use the `-d` parameter to run the container in `detached mode`.

~~~sh
docker run -p 8080:80 -d --name workshop workshop
docker ps
# Windows
start http://localhost:8080
# Mac OS
open http://localhost:8080
# Linux
curl http://localhost:8080
~~~

As you can see, the container is reachable on the hosts 8080 port. `-p` will map the port used inside the container to a specific port on the host. The `--name workshop` parameter gives the container a name which makes it easy to target a container. Otherwise you have to use the ID or a generated random name which you have to discover first using `docker ps`.

When we are done, we can kill and remove the container instance to cleanup the machine.

~~~sh
docker kill workshop
docker rm workshop
~~~

> Note: You can directly remove and kill the container in one command. `docker rm -f workshop`
