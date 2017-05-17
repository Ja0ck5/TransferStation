

# session variables 变量的定义

SHOW SESSION VARIABLES;

SHOW SESSION VARIABLES LIKE 'auto%';
# Variable_name             Value   
# ------------------------  --------
# auto_increment_increment  1       
# auto_increment_offset     1       
# autocommit                ON      
# automatic_sp_privileges   ON   

# set autocommit ='off'

# or 

# set @@session.autocommit='off'

# 全局变量
SHOW GLOBAL VARIABLES;


# stored procedure 存储过程是一组为了完成特定功能的语句集，编译后存储在数据库中。用户通过制定存储过程的名字并给定参数(如果有)来调用执行它
# 一个存储过程是一个可编程的函数

DELIMITER $$

CREATE PROCEDURE p_hello()
BEGIN 
		SELECT 'hello';
		SELECT 'world';
END	
$$


# 存储过程变量的定义

DELIMITER $$

CREATE PROCEDURE p_variable_test()
BEGIN
	# define a variable
	DECLARE a VARCHAR(20) DEFAULT 'abc';
	SELECT a;
END
$$

DELIMITER ;

CALL p_variable_test

# another procedure

DELIMITER $$

CREATE PROCEDURE p_var_test2()
BEGIN
	DECLARE inta INT;
	SET inta=10;
	SELECT inta AS num;
END
$$

CALL p_var_test2

# variable IN 输入参数 必须在调用存储过程之前指定，在存储过程中修改的值不能被返回

DELIMITER $$

CREATE PROCEDURE v_in_test(IN p_int INT)
BEGIN
	SELECT p_int;
	SET p_int = p_int + 1; # 存储过程中修改的值不能被返回
	SELECT p_int; 
END
$$

DELIMITER ;

SET @p_int = 10;

SELECT @p_int;

CALL v_in_test(@p_int);


# OUT 输出参数 可在存储过程中改变，并可以返回
# 在存储过程内部，该参数的初始值始终为 null. 无论调用者是否给存储过程参数设置值。
DELIMITER $$

CREATE PROCEDURE p_test_out(OUT v_out INT)
BEGIN
	SELECT v_out;
	SET v_out = 15;
	SELECT v_out;
END
$$

DELIMITER ;


SELECT  @p_v_out; # null

CALL p_test_out(@p_v_out);

SELECT @p_v_out;# 15

# INOUT 输入输出 可在调用时指定，也可以修改，返回。
# 与 OUT 参数类似，但是调用者还可以通过 INOUT 参数传递给存储过程

DELIMITER $$ 

CREATE PROCEDURE p_inout_test(INOUT v_inout INT)
BEGIN
	SELECT  v_inout AS v1;
	IF(v_inout IS NOT NULL) THEN
		SET v_inout = v_inout +1;
		SELECT v_inout AS v2;
	ELSE
		SELECT 1 INTO v_inout;
	END IF;
	SELECT v_inout AS v3;		
END
$$

DELIMITER ;

SET @v_inout=10;

CALL p_inout_test(@v_inout);

SELECT @v_inout; #11


# case ifnull function

DELIMITER $$

CREATE PROCEDURE p_showsalary(IN salary INT)
BEGIN 
	CASE salary
		WHEN 1000 THEN SELECT 'low';
		WHEN 10000 THEN SELECT 'mid';
		WHEN 100000 THEN SELECT 'hi';
		ELSE SELECT salary;
	END CASE;
END
$$

DELIMITER ;

CALL p_showsalary(1000);
CALL p_showsalary(10000);
CALL p_showsalary(100000);
CALL p_showsalary(100001);



# while

DELIMITER $$

CREATE PROCEDURE p_addnumber()
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE result INT DEFAULT 0;
	WHILE (i <= 100) DO
		SET result = result + i;
		SET i = i + 1; 
	END WHILE;
	SELECT result;
END
$$

DELIMITER ;
CALL p_addnumber();

# 查看存储过程

SHOW PROCEDURE STATUS WHERE db='mytest';

# 查看当前数据库下面的存储过程列表

SELECT specific_name FROM mysql.proc;

# 查看存储过程名称和过程
SELECT specific_name,body FROM mysql.proc;

SHOW  CREATE PROCEDURE p_hello;

DROP PROCEDURE IF EXISTS p_hello;

# 查看是否开启了创建函数的功能
SHOW VARIABLES LIKE '%fun%'; # log_bin_trust_function_creators  OFF 

# 开启该创建函数功能
SET GLOBAL log_bin_trust_function_creators=1;

# 函数一定有返回值
DELIMITER $$
CREATE FUNCTION f_test(a INT,b INT) RETURNS INT
BEGIN 
	RETURN a+b;	
END;
$$

DELIMITER ;

SELECT f_test(1,2);

SHOW CREATE FUNCTION f_test;

# views 视图 由查询结果形成的一张虚拟表。
# 使用场景，如果某个查询结果频繁出现，即频繁使用该结果进行子查询。

SELECT * FROM `information_schema`.`VIEWS`;

SELECT Drop_priv FROM mysql.`user` WHERE USER='root';

# trigger 是一种特殊的存储过程，在插入，删除，修改特定表中的数据时触发。比数据库本身的标准功能具有更精细更复杂的数据控制能力。

# 监视地点： 一般是表名
# 监视事件： update/delete/insert
# 触发时间  after/before  操作的前后时间
# 触发事件： update/delete/insert 

# 触发器不能直接调用，只能由数据库主动去执行。


DELIMITER $$
CREATE TRIGGER tr_insertEq AFTER INSERT 
ON userinfo FOR EACH ROW 
BEGIN
	#insert saraly values (new.sal);
END;
$$



# 锁

#MyISAM 表锁

#表共享读锁
# lock table 表名 read
# 解锁
# unlock tables;
#表独占写锁
# lock table 表名 write

SHOW VARIABLES LIKE '%concurrent%';

# 允许并发插入  concurrent_insert 值改为 2(无论表中间有没有被删除的行，都允许一个进程读表的时候，另一个进程在表的末尾插入记录)
# lock table 表名 read local;


# 事务 将引擎改为 innoDB
SHOW VARIABLES LIKE 'storage_engine'; # 修改为 InnoDB

SHOW ENGINES;

# start transaction; 也相当于解锁，隐含 unlock tables;

# 慢查询。mysql 记录 查询超过指定时间的语句。将超过指定时间的 sql 语句查询称为慢查询
# 所谓的指定时间是:long_query_time

SHOW VARIABLES LIKE 'long_query_time'; # long_query_time  10.000000 十秒

SHOW STATUS LIKE 'uptime';# mysql 服务器启动后的运行时间

SHOW STATUS LIKE 'com_Select';# 当前执行过的查询语句数

SHOW STATUS LIKE 'connections';# mysql 的连接数

# 索引

# 查看索引
SHOW KEYS FROM `tb_item`;

SHOW INDEXES FROM `tb_item`;
# 主键索引
# 唯一索引  所在列可以为 null 但是不能为空字符串  create unique index 索引名称 on 表名(具体列名)
# 全文索引  FULLTEXT 用于全文检索 只有 MyISAM 表才支持全文索引。只可以从 char varchar text列中创建。整个列都会编入索引，不支持对部分列编索引。
# 普通索引	create index 索引名称 on 表名(具体列名)

# 分析 sql 的执行计划
EXPLAIN SELECT * FROM tb_item;

SHOW PROFILE;
SELECT @@have_profiling;


# 分析表

ANALYZE LOCAL TABLE tb_item;

# 检查表

CHECK TABLE tb_item;


# 查看表状态
SHOW TABLE STATUS; 
# 查看指定表
# SHOW TABLE STATUS like '表名'; 




##################### Mysql 分区 ############################

# 将一张表的数据划分为几张表存储

# 查看是否支持分区

SHOW VARIABLES LIKE '%partition%';
# 或者
SHOW PLUGINS; # partition                   ACTIVE    STORAGE ENGINE      (NULL)   GPL    









