# Introduction
We'll start with a quick introduction with the basic concepts of containers.

## Labs
Let's get some first hand experience with running a container.

### 1 - Prerequisites
Before you can started, you have to make sure that you have installed Docker on your machines.

#### Docker for Mac/Windows

* **Docker for Mac**
* **Docker for Windows**

#### Linux
~~~sh
curl -fsSL get.docker.com | sh
sudo usermod -aG docker ubuntu
~~~

Execute to following command to output your current version of Docker running on your machine.

### 2 - Test your installation

~~~sh
docker info
~~~

### 3 - Run your first container

~~~sh
docker run hello-world
~~~
