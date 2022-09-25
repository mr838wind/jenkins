# jenkins
![](https://i.imgur.com/UvE05Bs.png)


Custom jenkins images with docker-compose,docker and all the plugins pre-installed

If you are using this on production, you may want to comment the password setup on the jenkins file 

```sh
docker build -t somejenkins .
docker run -d -v /var/run/docker.sock:/var/run/docker.sock
-v $(which docker):/usr/bin/docker -p 8080:8080 somejenkins
```

-----------------
## search plugin
- [jenkins plugin site](https://plugins.jenkins.io/)
- click plugin >> dependencies (artifactId)

-----------------
## dockerhub
- image name: mr838wind/jenkins_with_plugins
- docker build -t mr838wind/jenkins_with_plugins:v1.0 -t mr838wind/jenkins_with_plugins:latest .


