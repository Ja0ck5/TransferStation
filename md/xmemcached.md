

## spring 

	<?xml version="1.0" encoding="UTF-8"?>
	<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:mvc="http://www.springframework.org/schema/mvc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:p="http://www.springframework.org/schema/p" xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
       http://www.springframework.org/schema/context
        http://www.springframework.org/schema/context/spring-context-3.0.xsd
         http://www.springframework.org/schema/mvc
		http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd">

	<!-- 读取 properties 配置 文件 （在spring-mvc-hibernate.xml 中已配置 -->
	<!-- <bean id="propertyPlaceholderConfigurer" class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer"> 
		PropertiesLoaderSupport 的属性 <property name="locations"> <list> <value>classpath:xMemcached.properties</value> 
		</list> </property> </bean> -->
		
	<!-- memcached 分布式缓存配置 connectionPoolSize 连接数， failureMode 开发模式 -->
	<bean id="memcachedClientBuilder" class="net.rubyeye.xmemcached.XMemcachedClientBuilder">
		<!-- 设置服务器地址端口 ps: 多结点可以配置多个以及权重 -->
		<constructor-arg>
			<list>
				<bean class="java.net.InetSocketAddress">
					<constructor-arg>
						<!-- 配置server1 ip地址 -->
						<value>${memcached.server1.host}</value>
					</constructor-arg>
					<constructor-arg>
						<!-- 配置server1 端口 -->
						<value>${memcached.server1.port}</value>
					</constructor-arg>
				</bean>
				<bean class="java.net.InetSocketAddress">
					<constructor-arg>
						<!-- 配置server2 ip地址 -->
						<value>${memcached.server2.host}</value>
					</constructor-arg>
					<constructor-arg>
						<!-- 配置server2 端口 -->
						<value>${memcached.server2.port}</value>
					</constructor-arg>
				</bean>
				
<!-- 			<bean class="java.net.InetSocketAddress">
				<constructor-arg>
				配置 server3 ip地址 
				
				<value>${memcached.server3.host}</value>
				</constructor-arg>
				<constructor-arg>
				配置server3 端口
				<value>${memcached.server3.port}</value>
				</constructor-arg>
				</bean> -->
			</list>
		</constructor-arg>
		<!-- 集群时设置结点权重 -->
		<constructor-arg>
		<list>
		<value>${memcached.server1.weight}</value>
		<value>${memcached.server2.weight}</value>
		<!-- <value>${memcached.server3.weight}</value> -->
		</list>
		</constructor-arg>
		<!-- 二进制通信编码方式 -->
		<property name="commandFactory">
		<bean class="net.rubyeye.xmemcached.command.BinaryCommandFactory"/>
		</property>
		<!-- 缓冲区分配器 -->
		<property name="bufferAllocator">
			<bean class="net.rubyeye.xmemcached.buffer.SimpleBufferAllocator"></bean>
		</property>
		<!-- 文本通信编码方式 -->
		<!-- 		<property name="commandFactory">
			<bean class="net.rubyeye.xmemcached.command.TextCommandFactory"></bean>
		</property> -->
		<!-- Session 分配器 一致hash值 -->
		<property name="sessionLocator">
			<bean class="net.rubyeye.xmemcached.impl.KetamaMemcachedSessionLocator"></bean>
		</property>
		<!-- 通信转码器 -->
		<property name="transcoder">
			<bean class="net.rubyeye.xmemcached.transcoders.SerializingTranscoder" />
		</property>


		<property name="connectionPoolSize" value="${memcached.connectionPoolSize}" />
		<property name="failureMode" value="${memcached.failureMode}"/>
	</bean>
	<!-- 使用工厂bean来构建的memcached客户端 -->
	<bean id="memcachedClient" factory-bean="memcachedClientBuilder"
		factory-method="build" destroy-method="shutdown" />

	</beans>




## xMemcached.properties

		`# 连接池大小`  
		memcached.connectionPoolSize=20  
		`# 此模式下，当一个节点宕机，它会抛出 MemcachedException ` 
    	memcached.failureMode=true  
		`#node1`
		memcached.node1.host=127.0.0.1
	    memcached.node1.port=11211
        memcached.node1.weight=1  
		`#node2`
		memcached.node2.host=192.168.1.142
		memcached.node2.port=11211
		memcached.node2.weight=1
		`#node3`    
		`#memcached.node3.host=192.168.1.143`
		`#memcached.node3.port=11211`
		`#memcached.node3.weight=1`







