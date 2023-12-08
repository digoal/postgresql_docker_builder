# postgresql_docker_builder
Build PostgreSQL (with 200+ extenstions and tools) DuckDB MySQL and so on into One docker image. It used for learn database easily only.
    
Scripts in pg14_arm64 directory is used for build docker image with ARM64 chip.    
    
Scripts in pg14_amd64 directory is used for build docker image with AMD64 chip.   
    
# How to use the image?
## AMD64 chip
```
# 拉取镜像, 第一次拉取一次即可. 或者需要的时候执行, 将更新到最新镜像版本.  
docker pull registry.cn-hangzhou.aliyuncs.com/digoal/opensource_database:pg14_with_exts  
  
# 启动容器  
docker run --platform linux/amd64 -d -it -P --cap-add=SYS_PTRACE --cap-add SYS_ADMIN --privileged=true --name pg --shm-size=1g registry.cn-hangzhou.aliyuncs.com/digoal/opensource_database:pg14_with_exts

##### 如果你想学习备份恢复、修改参数等需要重启数据库实例的case, 换个启动参数, 使用参数--entrypoint将容器根进程换成bash更好. 如下: 
docker run -d -it -P --cap-add=SYS_PTRACE --cap-add SYS_ADMIN --privileged=true --name pg --shm-size=1g --entrypoint /bin/bash registry.cn-hangzhou.aliyuncs.com/digoal/opensource_database:pg14_with_exts
##### 以上启动方式需要进入容器后手工启动数据库实例: su - postgres; pg_ctl start;  
  
# 进入容器  
docker exec -ti pg bash  
  
# 连接数据库  
psql  
```

## ARM64 chip
```
# 拉取镜像, 第一次拉取一次即可. 或者需要的时候执行, 将更新到最新镜像版本.  
docker pull registry.cn-hangzhou.aliyuncs.com/digoal/opensource_database:pg14_with_exts_arm64  
  
# 启动容器  
docker run -d -it -P --cap-add=SYS_PTRACE --cap-add SYS_ADMIN --privileged=true --name pg --shm-size=1g registry.cn-hangzhou.aliyuncs.com/digoal/opensource_database:pg14_with_exts_arm64

##### 如果你想学习备份恢复、修改参数等需要重启数据库实例的case, 换个启动参数, 使用参数--entrypoint将容器根进程换成bash更好. 如下: 
docker run -d -it -P --cap-add=SYS_PTRACE --cap-add SYS_ADMIN --privileged=true --name pg --shm-size=1g --entrypoint /bin/bash registry.cn-hangzhou.aliyuncs.com/digoal/opensource_database:pg14_with_exts_arm64  
##### 以上启动方式需要进入容器后手工启动数据库实例: su - postgres; pg_ctl start;  
  
# 进入容器  
docker exec -ti pg bash  
  
# 连接数据库  
psql  
```
  
# The detail info for this docker builder script?
The info contain how to build docker image, and PostgreSQL extensions and tools description.   
  
[《amd64》](https://github.com/digoal/blog/blob/master/202307/20230710_03.md)  
  
[《arm64》](https://github.com/digoal/blog/blob/master/202308/20230814_02.md)  


