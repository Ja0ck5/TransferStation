

## 先卸载open-jdk

```
java –version
```

查看已安装的 java

```
rpm -qa | grep java
```

```
rpm -e --nodeps java-1.7.0-openjdk-1.7.0.45-2.4.3.3.el6.x86_64
rpm -e --nodeps java-1.6.0-openjdk-1.6.0.0-1.66.1.13.0.el6.x86_64
```

## 创建存放目录

执行命令


```
cd /usr/local/src
mkdir java
```

![](http://i.imgur.com/P4wFkiM.png)

```
rz
```
上传

或者自行到官网下载 jdk

## 解压


```
tar -xvf jdk-7u75-linux-x64.tar.gz
```

![](http://i.imgur.com/gnIB7kJ.png)

进入目录

    cd jdk1.7.0_75/

到 bin 目录

    cd bin/

执行命令


    ./java


![](http://i.imgur.com/0HCutlC.png)


> 安装成功


## 配置环境变量

执行命令

```
vim /etc/profile
```

![](http://i.imgur.com/3K6ZOrq.png)

在末尾添加配置

```
#set java environment
JAVA_HOME=/usr/local/src/java/jdk1.7.0_75
CLASSPATH=.:$JAVA_HOME/lib.tools.jar
PATH=$JAVA_HOME/bin:$PATH
export JAVA_HOME CLASSPATH PATH
```

保存退出

使更改的配置立即生效

```
source /etc/profile  
```

`java -version`  查看JDK版本信息

![](http://i.imgur.com/UR7X3hx.png)

