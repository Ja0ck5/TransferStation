# 			遇见 Scala （me before Scala）

​	主要是 Java 服务端的开发，会 Python(和Scala 开始学习的时间差不多)，C,C++(没怎么使用了)。

对于语言来说，并没有偏爱哪一门，只是哪门适合就用哪门。

​	开发当中基本使用 Java ，久而久之，偶尔也会觉得写起来是会冗长。对此，也时常窥探这微观问题，但是开发往往都是上升到宏观。如何负载，如何优化，如何解决历史遗留问题......

​	如果说为什么要学 Scala ,大概是自己的追求吧。
​	停下脚步，便会焦虑。

​	其实很早就知道了 Scala 但囿于 Java 都没吃透，便沉下心去学习 Java 及其 "周边"。

​	到了终于可以拿着 Java及其 "周边" 做点事情了，便计划开始学习 Scala 了。

​	Scala 是学习清单的一小部分，时常觉得时间不够用。

​	一开始遇见 Scala 是在 偶然看到 YouTube 的 Martin Odersky 在 Scala Days 2011 的演讲。[演讲](https://www.youtube.com/watch?v=3jg1AheF4n0&index=1&list=PL2N4GEaXeHh0byFvLKVnb9rFFEJtqXHb1)

#### 	首先就说到当今(2011年) 主流软件受到的挑战

1. 摩尔定律
2.  庞大的工作负担需要水平扩展来支撑
3. **”PPP“** popular power programming

![Challenge](<http://w2.dwstatic.com/yy/ojiastoreimage/638x477/1513131231036_11_len260264.png>)



#### 函数式编程/并行编程 与 命令式编程/并发编程

其中的 时空 对比



![](http://w2.dwstatic.com/yy/ojiastoreimage/644x479/1513132296806_11_len100978.png)



像很多人同时构造不同的部分，从而去解决一个问题。

![](<http://w2.dwstatic.com/yy/ojiastoreimage/641x438/1513132748997_11_len94533.png>)



#### Scala 是集大成者

1. 敏捷 ，具有轻量级语法
2. 是函数式的
3. 是面向对象的
4. 安全并且性能良好，具有强静态类型

![](<http://w2.dwstatic.com/yy/ojiastoreimage/637x440/1513132947550_11_len74604.png>)

Scala 比起 Java 更加简洁

写着写着 Scala 再用 Java 写总感觉有点累赘......

![](<http://w2.dwstatic.com/yy/ojiastoreimage/628x471/1513133244172_11_len145425.png>)



对此，在写 Python 的时候也感受到了简洁的力量，温柔而强大。当然，对于底层的认知，的确是需要花时间去好好研究，不止于用。

![](<http://w2.dwstatic.com/yy/ojiastoreimage/625x467/1513133401799_11_len216354.png>)



#### Scala 中的 Actors

一开始 Scala 中时有 Actors 模型，但是在 2.10 之后已经摒弃了，直接使用 Akka-actors 

![](<http://w2.dwstatic.com/yy/ojiastoreimage/630x473/1513133628171_11_len226553.png>)



