## 1	下载

### 1.1	目前最新的稳定版本 3.2.7

[http://download.redis.io/releases/redis-3.2.7.tar.gz](http://download.redis.io/releases/redis-3.2.7.tar.gz "http://download.redis.io/releases/redis-3.2.7.tar.gz")

### 1.2	创建存放目录

```
cd /usr/local/src/
mkdir redis
```

### 1.3	安装依赖

```
yum -y install cpp binutils glibc glibc-kernheaders glibc-common glibc-devel gcc make gcc-c++ libstdc++-devel tcl
```

已安装则不用安装

## 2	解压

```
tar -xvf redis-3.2.7.tar.gz
```

![](http://i.imgur.com/SQ8XYiE.png)

## 3	编译安装

```
make
make test #进行测试时长会比较长
make install
```

![](http://i.imgur.com/6wjpE8N.png)


## 4	启动并测试

当前目录下执行命令

```
redis-server
```

![](http://i.imgur.com/IyVnGSA.png)


为了方便操作，更改配置文件为 允许以后台进程的方式打开
> 
将配置文件拷贝到 /etc/ 下面

```
cp redis.conf /etc/
vi /etc/redis.conf
```

修改如下，默认为no

![](http://i.imgur.com/8nrG1ZE.png)

```
daemonize yes
```

![](http://i.imgur.com/n9naSKH.png)

### 4.1 启动

```
redis-server /etc/redis.conf
```

查看进程

```
ps -ef | grep redis
```

![](http://i.imgur.com/iDPGVLV.png)


### 4.2 CentOS 7 下开放6379 端口

```
firewall-cmd --add-port=6379/tcp --permanent
firewall-cmd –reload
```

已经开放

![](http://i.imgur.com/II8Zikt.png)

Before CentOS 7 

防火墙打开6379端口

```
/sbin/iptables -I INPUT -p tcp –dport 6379 -j ACCEPT
/etc/rc.d/init.d/iptables save
/etc/init.d/iptables status
```

### 4.3 客户端连接：

```
redis-cli
```

![](http://i.imgur.com/iK3p7X9.png)

### 4.4 远程连接：

```
vim /etc/redis.conf
```

![](http://i.imgur.com/ZeysJWX.png)


找到

``` 
\#bind
bind 127.0.0.1
```

**如果不修改，在远程的客户端连接会出现这样的情况**

![](http://i.imgur.com/LPLTFCV.png)

将其修改为

``` 
\#bind
0.0.0.0
```

![](http://i.imgur.com/5nB5i8D.png)


重新启动

![](http://i.imgur.com/f79UQNe.png)

### 4.5关闭

kill [pid] 不要加 -9




