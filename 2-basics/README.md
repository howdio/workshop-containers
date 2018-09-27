# Basics
Now we have Docker installed and even run our first container, it's time to get started with some basics. We will start with run a basic container and take a look inside. Next we going to discover one of the most important principals of containers, immutability.

## 1 - Run a basic container
Let's run Ubuntu using Docker.
~~~sh
docker run -it ubuntu
~~~

This will download the image and it's layers if they don't exist on your machine. The `-it` parameters make sure it runs a pseodo TTY and keeps your STDIN open to interact with container using the console.

~~~sh
cat /etc/issue
~~~
This should show something like `Ubuntu 18.04.1 LTS \n \l`. To exit from your container by typing `exit`.

Because you didn't specify a tag with the image it always defaults to `:latest`. If you do provide a tag it will get a different version of the image.
~~~sh
docker run -it ubuntu:16.04
cat /etc/issue
~~~
This should show something like `Ubuntu 16.04.5 LTS \n \l`.

> Note: Play around with your Ubuntu distribution and try to install software using `apt-get`. You can also try other distributions like Debian, Alpine or CentOS.

## 2 - Immutability
One important thing to know when using container is that images and it's layers are immutable. This means that they cannot be changed. This make a container basicly stateless and every change to the container will be lost once the container is terminated. This section of the lab will show this behavior.

Let's run the Ubuntu container again.
~~~sh
docker run -it ubuntu
~~~

Now we are going to make changes to the container by create a file.
~~~sh
echo "Hi there!" > message.txt
cat message.txt
exit
~~~

When exiting from a container it will be stopped automatically. Running a container again will create a new container instance which means that the state is lost. 

~~~sh
docker run -it ubuntu 
cat message.txt
~~~

As you see there is no message.txt in the container.

## 2 - Create an image

~~~sh
docker run -it ubuntu
echo "Hi there" > message.txt
~~~

When you exit from a container the state is still preserved until you remove it. In order to persist the changes in the container we have to create another image. This can be done by using `docker commit`.
~~~sh
export ContainerID=$(docker ps -al -q)
docker commit $ContainerID workshop
docker image ls
~~~

> Note: `docker ps` shows you the currently running containers. Adding `-a` it shows also the ones who have exited.

Now we have create the new image and let's run it to see if we can find the newly created file.

~~~sh
docker run --rm workshop cat message.txt
~~~

This will create a new container instance using the newly created image and executes the command directly without attaching the terminal. After the command has run it will exit from the container. The `--rm` parameter will remove the container instance as soon as the container exits.

You can see now that the state within the container is presisted inside the image layer. By building up images with layers you can make them re-usable and install your applications with dependencies.

> Note: If you would like to remove a container instance you should use `docker container rm` or `docker rm` for short.

> Tip: `docker rm -f $(docker ps -aq)` this command will terminate and remove all running containers on your machine.
