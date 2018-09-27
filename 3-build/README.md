# Build Docker images

## Labs

### 1 - Download the workshop
~~~sh
git clone https://github.com/howdio/workshop-containers
cd workshop-container
~~~

### 2 - Prepare Dockerfile
~~~sh
cp ./3-build/Dockerfile ./presentation/
cat ./presentation/Dockerfile
~~~

### 3 - Build image
~~~sh
docker build -t workshop ./presentation
docker image ls
~~~

### 4 - Run container
~~~sh
docker run -p 8080:80 -d workshop
docker ps
# Windows
start http://localhost:8080
# Mac OS
open http://localhost:8080
# Linux
curl http://localhost:8080
~~~
