
## 1.1	介绍


> `Percona` 是 `MySQL` 的分支或者说衍生版本，`Percona` 为 `MySQL` 数据库服务器进行了改进，在功能和性能上较 `MySQL` 有着很显著的提升。该版本提升了在高负载情况下的 `InnoDB` 的性能、为 `DBA` 提供一些非常有用的性能诊断工具；另外有更多的参数和命令来控制服务器行为。
> 
> **可扩展性**：处理更多事务；在强大的服务器上进行扩展
> 
> **性能**：使用了 **`XtraDB`** 的 `Percona Server` 速度非常快
> 
> **可靠性**：避免损坏，提供崩溃安全(`crash-safe`)复制
> 
> **管理**：在线备份，在线表格导入/导出
> 
> **诊断**：高级分析和检测
> 
> **灵活性**：可变的页面大小，改进的缓冲池管理
> 
> `Percona Server` 只包含 `MySQL` 的服务器版，并没有提供相应对 `MySQL` 的 Connector 和 GUI 工具进行改进。
> 
> `Percona Server` 只提供 `Linux` 的版本。


## 1.2	下载

[https://www.percona.com/downloads/](https://www.percona.com/downloads/ "https://www.percona.com/downloads/")

### 1.2.1	准备


安装 cmake
执行命令

```
yum -y install cmake
```

创建 percona 存放目录

```
cd /usr/local/src/
mkdir mysql-percona
cd mysql-percona/
wget https://www.percona.com/downloads/Percona-Server-5.6/Percona-Server-5.6.21-70.0
```

或者
```
rz #上传安装包
```

解压

```
tar -xvf Percona-Server-5.6.21-70.0-r688-el6-x86_64-bundle.tar
```

![](http://i.imgur.com/jXruHf1.png)

安装如下几个就可以了:

首先需安装

```
rpm -ivh Percona-Server-shared-56-5.6.21-rel70.0.el6.x86_64.rpm
```

然后

```
rpm -ivh Percona-Server-client-56-5.6.21-rel70.0.el6.x86_64.rpm
```

再然后

```
rpm -ivh Percona-Server-server-56-5.6.21-rel70.0.el6.x86_64.rpm
```

## 1.3	报错libaio.so.1()(64bit) is needed by

![](http://i.imgur.com/3autKyj.png)

安装依赖

```
yum -y install libaio
```

部分可解决，部分依然会存在问题。推荐使用 `yum` 安装 `Percona`

## 1.4	yum 安装(推荐)

执行命令

```
yum install Percona-Server-client-56 Percona-Server-server-56
```

安装 `Percona` 的服务器和客户端、共享库

![](http://i.imgur.com/mhRvyjP.png)

### 1.4.1	启动mysql

```
systemctl start mysql
```

查看状态

```
systemctl status mysql
```

![](http://i.imgur.com/DaxAYn6.png)


## 1.5	登录mysql

执行命令

```
mysql -uroot –p
```

一开始默认是没有密码，直接敲 `Enter`

![](http://i.imgur.com/rrjAGOd.png)


### 1.5.1	修改密码

```
mysqladmin -uroot password "123456"
```

![](http://i.imgur.com/BBp5FwX.png)

会出现警告，这种方式不安全。但是不影响使用

登录

![](http://i.imgur.com/lJUTAb3.png)

## 1.6	设置远程访问

```
grant all privileges on *.* to 'root' @'%' identified by '123456'; 
flush privileges;
```

![](http://i.imgur.com/dv0oQKe.png)


###  1.6.1	Before CentOS 7 

防火墙打开3306端口

```
/sbin/iptables -I INPUT -p tcp --dport 3306 -j ACCEPT
/etc/rc.d/init.d/iptables save
/etc/init.d/iptables status
```

### 1.6.2	CentOS 7 

查询端口是否开放

```
firewall-cmd --query-port=3306/tcp2
```

开端口号

```
firewall-cmd --add-port=3306/tcp 
```

这里把3306替换为需要开的端口号 后面加上参数 `--permanent` 则是永久开放

![](http://i.imgur.com/8EhWH9n.png)


## 1.7	测试连接

连接成功

![](http://i.imgur.com/jEe6psV.png)

## 1.8 mysql 访问速度


原因：
mysql客户端每次访问db，mysql就会试图去解析来访问的机器的hostname，并缓存到hostname cache，如果这时解析不了，等一段时间会失败，数据才能被取过来。

```
vim /etc/my.cnf
```

在


    [mysqld]

添加如下配置

    skip-name-resolve

![](http://i.imgur.com/g1iUIxa.png)

重启mysql服务：

```
service mysql restart
```

## 1.9	执行脚本

若有数据库脚本文件 mydb.sql 则可以使用以下命令执行该脚本


```
cat [sqlscript] | mysql -uroot -p123456 -D[databaseName]
```

`sqlscript` 数据库脚本文件
`databaseName` 选中的数据库名称


