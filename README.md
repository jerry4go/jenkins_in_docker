# 下载

`git clone https://github.com/jerry4go/jenkins_in_docker.git`

# 构建

`docker build -t jks:2.4 .`

# 运行

```docker
docker run \
-d \
--restart=always \
-p 8080:8080 \
-p 50000:50000 \
-v /data/jenkins_home:/var/jenkins_home \
-u root \
--name=Jenkins \
jks:2.4

```

#### 8080端口

web访问端口

#### 50000端口 

slave agent访问端口,如果不需要可以不开放

## 文件说明

#### executors.groovy 

定义jenkins并发作业的job数量

#### plugins.txt

定义jenkins集成哪些插件，以及插件对应的版本

不带版本号，则使用最新的版本

## jenkins behind an nginx reverse proxy

https://wiki.jenkins.io/display/JENKINS/Jenkins+behind+an+NGinX+reverse+proxy

## jenkins behind an apache reverse proxy

https://wiki.jenkins.io/display/JENKINS/Running+Jenkins+behind+Apache