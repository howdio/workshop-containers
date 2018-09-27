# Introduction
We'll start with a quick introduction on how to get started with containers and install Docker on your machines to get started.

## 1 - Prerequisites
Before you can started, you have to make sure that you have installed Docker on your machine. There are two flavors of Docker so to say. One is the Docker for Desktop which allows you to easily create and run containers on you own OS. The other is the just installing the Docker Host on Linux, which you actually use in production. 

### Docker for Mac/Windows
Installing Docker on your developer machine is easy. There are two operating systems which are supported, Mac & Windows. Because Docker runs on Linux or Windows Server 2016+ and these operating systems are usually not used for development you have to run a VM on your machine. Docker for Desktop installs and setup the required software to host this VM and do the required port and disk mappings.

* **Docker for Mac**: [download](https://store.docker.com/editions/community/docker-ce-desktop-mac)
* **Docker for Windows**: [download](https://store.docker.com/editions/community/docker-ce-desktop-windows)

> Note: You need to create an account on the Docker website in order to download the software.

### Linux
On Linux it's the easiest way to install the Docker Host. This is also how you would run containers in production. And install script which you can download directly from the Docker website. It will install Docker in the correct way on the support distributions and version.

~~~sh
curl -fsSL get.docker.com | sh
sudo usermod -aG docker ubuntu
~~~

> Note: the last statement makes sure you don't have to use `sudo` in front of each docker command. It's recommended to do this in production.

## 2 - Test your installation
Now we have successfully installed Docker on the machine and it's time to see if it's installed correctly.

~~~sh
docker info
~~~

> Note: this command show you the basic settings of your Docker host and client. You can use it to diagnose your environment.

## 3 - Run your first container
Docker is installed and ready to use. Let's run your first container.

~~~sh
docker run hello-world
~~~

Congratulations! You have successfully installed Docker on your machine and run your first container.
