

## 1.	安装

安装 `erlang`
官方建议使用 打包的版本。

### 1.1.	添加Erlang的解决方案库（包括验证签名包的公钥）到你的系统中，调用下面的命令

#### 1.1.1.	下载安装包

```
wget https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
```

![](http://i.imgur.com/eawQOkD.png)

```
rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
```

![](http://i.imgur.com/7LpsP5o.png)

#### 1.1.2.	添加 Erlang Solutions key

```
rpm --import https://packages.erlang-solutions.com/rpm/erlang_solutions.asc

sudo yum install erlang
```

![](http://i.imgur.com/bZFyMOT.png)


![](http://i.imgur.com/D9ARrlw.png)

因为依赖包很多，加上网速不快，所以这个过程会比较慢。


### 1.2.	另一种方法

```
wget https://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/esl-erlang_19.2.2~centos~7_amd64.rpm

yum install esl-erlang_19.2.2~centos~7_amd64.rpm

wget https://github.com/jasonmcintosh/esl-erlang-compat/releases/download/1.1.1/esl-erlang-compat-18.1-1.noarch.rpm

yum install esl-erlang-compat-18.1-1.noarch.rpm
```



这种安装方式就会快一点。



## 2.	安装 RabbitMq

### 2.1 导入签名

```
rpm --import https://www.rabbitmq.com/rabbitmq-release-signing-key.asc
```

### 2.2 获取rpm

```
wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.6/rabbitmq-server-3.6.6-1.el7.noarch.rpm
```

整个过程比较慢

![](http://i.imgur.com/ytkzRxy.png)




### 2.3安装

因为是 centOS 7 所以使用的 rpm 有点不太一样总之，使用下载之后的那个包就是没问题的。

```
yum install rabbitmq-server-3.6.6-1.el7.noarch.rpm
```

## 3.	启动停止


Before CentOS 7 

```
service rabbitmq-server start
service rabbitmq-server stop
service rabbitmq-server restart
```

CentOS 7：

```
systemctl start rabbitmq-server
systemctl stop rabbitmq-server
systemctl status rabbitmq-server
```

![](http://i.imgur.com/WIZu7a2.png)



设置开机启动(非必须)

```
systemctl enable rabbitmq-server.service
```

> 指令参考

![](http://i.imgur.com/HnHopKI.png)

## 4.	远程登录

由于 `RabbitMq` 的默认账户 `guest` 是不允许远程登录的，所以需要修改配置文件。

切换目录

```
cd /etc/rabbitmq/
```

![](http://i.imgur.com/bZmveYI.png)


文件夹里面暂时是空的。

### 4.1 拷贝配置文件

```
cp /usr/share/doc/rabbitmq-server-3.6.6/rabbitmq.config.example /etc/rabbitmq/
```

即是拷贝到当前目录
 


> cp /usr/share/doc/rabbitmq-server-3.6.6/rabbitmq.config.example  **.**【这里有一个点”.” 当前目录】



### 4.2 重命名

```
mv rabbitmq.config.example rabbitmq.config
```

### 4.3 编辑  rabbitmq.config

```
vim rabbitmq.config
```

将注释去掉，并且将后面的逗号去掉

![](http://i.imgur.com/ZnPEugS.png)



### 4.4 开启管理工具

```
rabbitmq-plugins enable rabbitmq_management
```

![](http://i.imgur.com/Cbs4XO9.png)


重启

```
systemctl restart rabbitmq-server
```
或者

```
service rabbitmq-server restart
```

### 4.5 开放端口

官方建议开放的端口


![](http://i.imgur.com/iexALMh.png)


需要使用到的端口则自行开启

Before CentOS 7 

```
/sbin/iptables -I INPUT -p tcp –dport 25672 -j ACCEPT

/sbin/iptables -I INPUT -p tcp --dport 15672 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 5672 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 5671 -j ACCEPT

/etc/rc.d/init.d/iptables save
```


CentOS 7

```
firewall-cmd --add-port=5671/tcp
firewall-cmd --add-port=5672/tcp
firewall-cmd --add-port=15672/tcp
firewall-cmd --add-port=25672/tcp
```


## 5.	访问成功

![](http://i.imgur.com/Bgcl8MN.png)

![](http://i.imgur.com/LsVLaLt.png)

## 6.	添加用户或者更改密码


因为需要发布外网，为了安全，则修改密码。


![](http://i.imgur.com/9yDR4xv.png)


![](http://i.imgur.com/DUXlqPX.png)

### 6.1 设置权限

![](http://i.imgur.com/RNguLB1.png)


### 6.2 登录成功

![](http://i.imgur.com/MwSSIQg.png)