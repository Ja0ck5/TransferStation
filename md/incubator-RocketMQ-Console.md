# RockerMQ Console Ng


RocketMQ 给 apache 孵化之后的 控制台位置在 
[https://github.com/apache/incubator-rocketmq-externals](https://github.com/apache/incubator-rocketmq-externals "https://github.com/apache/incubator-rocketmq-externals")

其中 

![控制台位置](http://i.imgur.com/edABG5c.png)

    
    git clone git@github.com:apache/incubator-rocketmq-externals.git

##   maven 编译 rocketmq-console 得到

	![](http://i.imgur.com/MB4n0ox.png)

## 到 jar 包目录下执行

	java -jar  rocketmq-console-ng-1.0.0.jar


## 配置文件 application.yml
		
		server:
		  contextPath:
		  port: 8080
		#spring.application.index=true
		spring:
		  application:
		    name: rocketmq-console
		  http: 
		    encoding:
		       charset: UTF-8
		       enabled: true
		       force: true
		logging:
		  config: classpath:logback.xml
		  
		#if this value is empty,use env value rocketmq.config.namesrvAddr  NAMESRV_ADDR | now, you can set it in ops page.default localhost:9876
		rocketmq: 
		  config:
		    namesrvAddr: 192.168.72.132:9876;192.168.72.134:9876
		#if you use rocketmq version < 3.5.8, rocketmq.config.isVIPChannel should be false.default true
		    isVIPChannel: 
		#rocketmq-console's data path:dashboard/monitor
		#rocketmq.config.dataPath=/tmp/rocketmq-console/data
		    dataPath: D:/temp/rocketmq-console/data
		#set it false if you don't want use dashboard.default true
		    enableDashBoardCollect: true
	
	
  

   
## 问题



>  若出现 Caused by: org.apache.rocketmq.remoting.exception.RemotingConnectException: connect to <192.0.0.1:10911> failed 需要在启动的 配置文件 broker-a.properties 配置具体的 broker 的ip
	
	brokerIP1=192.168.72.132 [具体的服务器的IP地址]


## 控制台界面

 ![](http://i.imgur.com/wM7lerI.png)
	



