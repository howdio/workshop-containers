# Advanced
We have covered that basic concepts of building and running containers. This lab shows some advanced scenarios.

## 1 - Volume mounts
~~~sh
docker volume create --name workshop-files
docker run --rm -v workshop-files:/workshop -v $(pwd):/src -it ubuntu
cp -r /src/presentation/* /workshop/
exit
~~~

~~~sh
docker run -d --rm  -p 8080:80 -v workshop-files:/usr/share/nginx/html nginx
~~~

## 2 - Attach to a running container

~~~sh
docker run -d --rm  -p 8080:80 -v workshop-files:/usr/share/nginx/html --name nginx nginx
~~~

~~~sh
docker exec -it nginx /bin/bash
~~~
