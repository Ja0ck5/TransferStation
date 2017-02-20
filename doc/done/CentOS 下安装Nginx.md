

## 1	安装依赖

```
yum -y install gcc-c++  
yum -y install pcre pcre-devel  
yum -y install zlib zlib-devel
yum -y install libtool 
yum -y install openssl openssl—devel
```

## 2	下载 Nginx

[http://nginx.org/download/nginx-1.10.3.tar.gz](http://nginx.org/download/nginx-1.10.3.tar.gz "http://nginx.org/download/nginx-1.10.3.tar.gz")


### 2.1	创建下载存放的目录

```
mkdir /usr/local/src/nginx
```

![](http://i.imgur.com/1vMx55K.png)

### 2.2	切换到当前目录

```
cd /usr/local/src/nginx
```

### 2.3	当前目录下载 nginx

```
wget http://nginx.org/download/nginx-1.10.3.tar.gz
```

或者执行命令 

```
rz
```

![](http://i.imgur.com/kjdVPCS.png)

### 2.4	解压

```
tar -xvf nginx-1.10.3.tar.gz
```

![](http://i.imgur.com/tQb7RhW.png)

进入解压后的文件夹

```
cd nginx-1.10.3
```

安装到/ucommon
创建文件夹，交给普通用户管理

```
mkdir -p /ucommon/soft/nginx
```

![](http://i.imgur.com/MdDifty.png)


### 2.5	指定安装路径、用户以及所属组

```
./configure --prefix=/ucommon/soft/nginx --user=ucommon --group=ucommon
```

![](http://i.imgur.com/KwkgS7B.png)

```
make  
make install
```

![](http://i.imgur.com/8rLKAln.png)


## 3	启动 nginx

进入 `sbin` 目录

```
cd sbin/
```

![](http://i.imgur.com/VAhU36p.png)


启动 `nginx`

```
./nginx
```

查看进程
```
ps –ef | grep nginx
```

![](http://i.imgur.com/9Hc3O3U.png)


### 3.1	Before CentOS 7 

```
防火墙打开80端口
service iptables stop //关闭防火墙
/sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT
/etc/rc.d/init.d/iptables save
/etc/init.d/iptables status
```

### 3.2	CentOS7

查询端口号：

```
firewall-cmd --query-port=80/tcp2
```

开端口号

```
firewall-cmd --add-port=80/tcp 
```

这里把80替换为需要开的端口号 后面加上参数 `--permanent` 则是永久开启
一行命令开多个端口号
开永久端口号

```
firewall-cmd --add-port=80/tcp --permanent&& firewall-cmd --add-port=8080/tcp –permanent
firewall-cmd --reload 
```

![](http://i.imgur.com/6oUgxXD.png)


![](http://i.imgur.com/WNWVQio.png)


## 4	非root用户不能占用80端口

非root用户不能占用80端口
所以使普通用户以 root 身份启动 nginx。

```
cd /ucenter/soft/nginx/sbin
chown root nginx
```

普通用户对此也有root权限

```
chmod u+s nginx
```

![](http://i.imgur.com/fS13hJi.png)





