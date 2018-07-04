# nuxt-docker
nuxt docker image include basic template project

## build 
```
docker build -t nuxt-docker .
```
## run
* need to port 3000
```
docker run --rm -it -p 3000:3000 nuxt-docker
# check
curl localhost:3000
```
