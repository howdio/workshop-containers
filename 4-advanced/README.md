# Advanced

## Labs

### 1 - Volume mounts
~~~sh
docker volume create --name workshop-files
docker run --rm -v workshop-files:/workshop -v $(pwd):/src ubuntu cp -r /src/presentation/* /workshop/
~~~

~~~sh
docker run -d --rm  -p 8080:80 -v workshop-files:/usr/share/nginx/html nginx
~~~
