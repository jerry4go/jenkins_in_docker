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
jks2.4

```

#### 8080端口

web访问端口

#### 50000端口 

slave agent访问端口,如果不需要可以不开放