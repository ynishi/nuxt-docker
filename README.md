# nuxt-docker
nuxt docker image include basic template project

## Run basic project 
```
# run at port 3000
PORT=3000
docker run --rm -it -p ${PORT}:3000 ynishi/nuxt-docker
# access
curl localhost:${PORT}
```
## create new nuxt app
```
docker run --rm -it -v $(pwd):/project ynishi/nuxt-docker vue init ${template} ${appname}
# appname dir will be created in current dir.
```
## run your nuxt app in docker
* make your Dockerfile in nuxt app dir.
```
FROM ynishi/nuxt-docker

COPY . /project
RUN yarn
```
* build and run docker
```
cd ${appdir}
docker build -t ${imagename} .
docker run --rm -it -p ${port}:3000 ${imagename}
```
