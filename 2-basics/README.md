# Basics

## Labs

### 1 - Run a basic container
~~~sh
docker run -it ubuntu
~~~

~~~sh
cat /etc/issue
~~~
Ubuntu 18.04.1 LTS \n \l

~~~sh
exit
docker run -it ubuntu:16.04
cat /etc/issue
~~~
Ubuntu 16.04.5 LTS \n \l

### 2 - Immutability

~~~sh
docker run -it ubuntu
~~~

~~~sh
echo "Hi there!" > message.txt
cat message.txt
exit
~~~

~~~sh
docker run -it ubuntu 
~~~

~~~sh
cat message.txt
~~~

### 2 - Create an image

~~~sh
docker run ubuntu echo "Hi there!" > message.txt
~~~

~~~sh
export ContainerID=$(docker ps -al -q)
docker commit $ContainerID workshop
docker image ls
~~~

~~~sh
docker run --rm workshop cat message.txt
~~~
