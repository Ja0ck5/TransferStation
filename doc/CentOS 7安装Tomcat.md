
### 1.1	切换到普通用户

```
su - ucommon
```

根目录下创建 web 文件夹用于存放 tomcat

```
mkdir web
```

上传 `rz`

或者下载 tomcat

```
wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-7/v7.0.75/bin/apache-tomcat-7.0.75.tar.gz
```


### 1.2	解压

```
tar -xvf apache-tomcat-7.0.75.tar.gz
```

### 1.3	开放端口

```
firewall-cmd --zone=public --add-port=8080/tcp –permanent

firewall-cmd –reload

firewall-cmd --zone=public --list-ports

```
![](http://i.imgur.com/ZfusCY9.png)

### 1.4	切换到bin 目录下启动
```
./startup.sh
```

![](http://i.imgur.com/VPMVeRV.png)


### 1.5	查看日志

```
tail -f ../logs/catalina.out
```

![](http://i.imgur.com/vIFocCq.png)

### 1.6	访问

![](http://i.imgur.com/C9HuYvW.png)
