

## go-zero-looklook

English | [简体中文](README-cn.md)



## Summary



#### The old rule is to give a star before you see it. Ha ~ ~, if the star is caught, you have to spank, ha ha

I may have contacted go zero earlier. I have been using go zero since about 1000star. Later, I became familiar with the go zero author through wechat. The go zero author was very enthusiastic and patient to help me answer many questions. I also want to actively help go zero promote the community, Basically, I answered the relevant questions in the community group, because in this process, I found that many people felt that go zero did not have a complete project example. As a member of the community who wanted to promote the community, I made an available version open source. The main technology stack includes the following：



##### Tips : If you are not familiar with many of the technology stack here, do not be afraid, as long as you will mysql, redis can start these two middleware in the start of the project first run up the project, the other can slowly learn.




- k8s
- go-zero
- nginx-gateway
- filebeat
- kafka
- go-stash
- elasticsearch
- kibana
- prometheus
- grafana
- jaeger
- go-queue
- asynq
- asynqmon
- dtm
- docker
- docker-compose
- mysql
- redis
- modd
- jenkins
- gitlab
- harbor



## Tutorial video

This is the go zero tutorial I'm recording ：https://space.bilibili.com/389552232/video

At the end of this tutorial, we will also share go-zero -looklook. Please look forward to it～



## Doc

 Documentation can de found under [doc/english](doc/english/) in the project.



Docker compose is recommended in the development environment of the project. The direct chain method is used to give up the trouble caused by service registration and discovery middleware (etcd, nacos, consul ...)

For testing and online deployment, k8s (etcd, Nacos, consumer, etc.) has detailed tutorials (build + deploy), which can be communicated in the go zero community group, which is very easy



## Project Summary

The whole project uses the micro services developed by go zero, which basically includes go zero and some middleware developed by relevant go zero authors. The technology stack used is basically the self-developed component of the go zero project team, which is basically the go zero software



The project directory structure is as follows：


- app：All business codes include API, RPC and MQ (message queue, delay queue, scheduled task)
- common：General components ( error、middleware、interceptor、tool、ctxdata ...)
- data：The project contains the data generated by the directory relying on all middleware (mysql, ES, redis, grafana, ...). All contents in this directory should be in Git ignore files and do not need to be submitted.
- deploy：

    - filebeat: docker deployment filebeat config
    - go-stash：go-stash config
    - nginx: nginx-gateway config
    - prometheus ： prometheus config
    - script：
        - gencode：auto generate api、rpc，and use kafka script  ，copy and paste use
        - mysql：auto generate model code shell script
    - goctl:  The template and goctl of the project generate custom code templates. For the usage of template, refer to the go zero document and copy it to the home directory Goctl is enough
- doc : This project series documents
- modd.conf :  Don't be afraid of Modd hot loading configuration file. It's very simple to use. You can learn more about Modd usage here: https://github.com/cortesi/modd , the image of this project only uses golang-1.17.7-alpine as the basic image and installs Modd internally. If you want to add goctl, protoc, golint, etc., it's the same to directly create an image without my image





## System architecture diagram

![jiagou](./doc/chinese/images/1/gozerolooklook.png)

## Business architecture diagram

![jiagou](./doc/chinese/images/1/go-zero-looklook-service.png)


## Gateway

nginx do external gateway, gateway in front of the slb, in addition, many students feel that nginx do not do gateway is not very good, this piece of principle is basically the same, you can replace it with apisix, kong, etc. 



## Development mode

This project uses microservice development, API (HTTP) + RPC (grpc). The API acts as an aggregation service, and the complex and related business calls are uniformly written in RPC. If some simple businesses will not be relied on by other services, they can be directly written in the logic of API



## Log

For logs, filebeat is used to collect them and report them to Kafka. Because logstash knows everything and the resource occupation is too exaggerated, go stash is used instead of logstash

Link: https://github.com/kevwan/go-stash , go stash is developed by the go zero development team. It has high performance and does not occupy resources. There is not much main code. It can be used only by configuration. It is very simple. The Kafka data source is synchronized to elasticsearch. The elasticsearch account and password are not supported by default. I fork a copy and modify it. It simply supports the account and password



## Monitor

Prometheus is used for monitoring. This go zero native support only requires configuration. Here you can see the configuration in the project



## Link tracking

Go zero supports Jaeger and Zipkin by default. You only need to configure it. You can see the configuration



## Pub\Sub

kafka ，Publish subscription using go-zero development team developed by go-queue, link: https://github.com/zeromicro/go-queue

Here we use kq, kq is based on kafka to do high-performance publish subscriptions



## Message queues, delayed queues, timed tasks

Message queues, delay queues, timed tasks This project uses asynq, a simple middleware developed based on redis.

Of course, the message queue you can also use go-queue

Link: https://github.com/hibiken/asynq



## Distributed transaction

DTM is used for distributed transactions. Well, it's very comfortable. I wrote a "go zero nanny tutorial on connecting distributed transactions with DTM" link address: https://github.com/Mikaelemmmm/gozerodtm , this project has not been used yet. It's good to prepare for direct integration in the future. If readers use it, they can directly look at the source code

Dtm Link : https://github.com/dtm-labs/dtm



## Deploy

Docker compose is recommended in the development environment of the project. The direct chain method is used to give up the trouble caused by service registration and discovery middleware (etcd, Nacos, consul, ...)

For testing and online deployment, k8s (etcd, Nacos, consumer, etc.) has detailed tutorials (build + deploy), which can be communicated in the go zero community group, which is very easy

project doc ：[https://github.com/Mikaelemmmm/go-zero-looklook/tree/main/doc](doc/)

gitlab + jenkins + harbor + k8s

Click in jenkins to deploy the corresponding service, will go to gitlab to pull the code --> then go to pull the online configuration (online configuration of a separate git repository, why not use the configuration center, the deployment documentation has an introduction) ----> automatically build the image --> push to harbor mirror repository --> use kubectl to automatically publish to k8s ----> in front to hang a nginx do gateway unified portal



## Thanks

go-zero : https://github.com/zeromicro/go-zero

dtm：https://github.com/dtm-labs/dtm



