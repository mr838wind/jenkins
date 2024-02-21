# jenkins
![](https://i.imgur.com/UvE05Bs.png)


Custom jenkins images with docker-compose,docker and all the plugins pre-installed

If you are using this on production, you may want to comment the password setup on the jenkins file 

-----------------
## search plugin
- [jenkins plugin site](https://plugins.jenkins.io/)
- click plugin >> dependencies (artifactId)

-----------------
## dockerhub
- image name: mr838wind/jenkins_with_plugins
- or run with:  docker-compose up -d 

```sh
docker build -t mr838wind/jenkins_with_plugins:v1.2 -t mr838wind/jenkins_with_plugins:latest .
docker run -d -p 82:8080 -v /var/run/docker.sock:/var/run/docker.sock mr838wind/jenkins_with_plugins:latest

docker login
docker push mr838wind/jenkins_with_plugins:v1.2
docker push mr838wind/jenkins_with_plugins:latest
```

-----------------
## debug

MACOS: ERROR: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
- sudo ln -s ~/Library/Containers/com.docker.docker/Data/docker.raw.sock /var/run/docker.sock

