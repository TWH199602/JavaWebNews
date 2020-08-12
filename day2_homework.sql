  DROP DATABASE day2_homework;
  CREATE DATABASE day2_homework;
  USE day2_homework;

  CREATE TABLE fruits
  (
      f_id    char(10)      NOT NULL,
      s_id    INT           NOT NULL,
      f_name  char(255)     NOT NULL,
      f_price decimal(8, 2) NOT NULL,
      PRIMARY KEY (f_id)
  );
  INSERT INTO fruits (f_id, s_id, f_name, f_price)
  VALUES ('a1', 101, 'apple', 5.2),
         ('b1', 101, 'blackberry', 10.2),
         ('bs1', 102, 'orange', 11.2),
         ('bs2', 105, 'melon', 8.2),
         ('t1', 102, 'banana', 10.3),
         ('t2', 102, 'grape', 5.3),
         ('o2', 103, 'coconut', 9.2),
         ('c0', 101, 'cherry', 3.2),
         ('a2', 103, 'apricot', 2.2),
         ('l2', 104, 'lemon', 6.4),
         ('b2', 104, 'berry', 7.6),
         ('m1', 106, 'mango', 15.6),
         ('m2', 105, 'xbabay', 2.6),
         ('t4', 107, 'xbababa', 3.6),
         ('m3', 105, 'xxtt', 11.6),
         ('b5', 107, 'xxxx', 3.6);
  -- 从fruits表中检索所有字段的数据
  -- 查询fruits表中f_name列所有水果名称
  -- 从fruits表中获取f_name和f_price两列
  -- 该语句使用SELECT声明从fruits表中获取名称为f_name和f_price两个字段下的所有水果名称和价格
  -- 查询价格为10.2元的水果的名称
  -- 查找名称为“apple”的水果的价格
  -- 查询价格小于10的水果的名称
  -- 查询s_id为101和102的记录
  -- 查询所有s_id不等于101也不等于102的记录
  -- 查询价格在2.00元到10.20元之间的水果名称和价格
  -- 查询价格在2.00元到10.20元之外的水果名称和价格
  -- 查找所有以’b’字母开头的水果
  -- 在fruits表中，查询f_name中包含字母’g’的记录
  -- 查询以’b’开头，并以’y’结尾的水果的名称
  -- 在fruits表中，查询以字母’y’结尾，且’y’前面只有4个字母的记录
  SELECT * from fruits;
  SELECT f_name from fruits;
  SELECT f_name , f_price from fruits;
  SELECT f_name FROM fruits WHERE f_price = 10.2;
  SELECT f_price FROM fruits WHERE f_name = 'apple';
  SELECT f_name FROM fruits WHERE f_price <= 10;
  SELECT * FROM fruits where s_id in (101,102);
  SELECT * FROM fruits WHERE s_id not in (101,102);
  SELECT * FROM fruits WHERE f_price BETWEEN 2.00 and 10.20;
  SELECT * FROM fruits WHERE f_price not BETWEEN 2.00 and 10.20;
  SELECT * FROM fruits WHERE f_name LIKE 'b%';
  SELECT * FROM fruits WHERE f_name LIKE '%g%';
  SELECT * FROM fruits WHERE f_name LIKE 'b%y';
  SELECT * FROM fruits WHERE f_name LIKE '____y';


  CREATE TABLE dept
  (
      d_no       INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
      d_name     VARCHAR(50),
      d_location VARCHAR(100)
  );
  CREATE TABLE employee
  (
      e_no     INT          NOT NULL PRIMARY KEY,
      e_name   VARCHAR(100) NOT NULL,
      e_gender CHAR(2)      NOT NULL,
      dept_no  INT          NOT NULL,
      e_job    VARCHAR(100) NOT NULL,
      e_salary SMALLINT     NOT NULL,
      hireDate DATE
  );
  INSERT INTO dept
  VALUES (10, 'ACCOUNTING', 'ShangHai'),
         (20, 'RESEARCH ', 'BeiJing '),
         (30, 'SALES ', 'ShenZhen '),
         (40, 'OPERATIONS ', 'FuJian ');
  INSERT INTO employee
  VALUES (1001, 'SMITH', 'm', 20, 'CLERK', 800, '2005-11-12'),
         (1002, 'ALLEN', 'f', 30, 'SALESMAN', 1600, '2003-05-12'),
         (1003, 'WARD', 'f', 30, 'SALESMAN', 1250, '2003-05-12'),
         (1004, 'JONES', 'm', 20, 'MANAGER', 2975, '1998-05-18'),
         (1005, 'MARTIN', 'm', 30, 'SALESMAN', 1250, '2001-06-12'),
         (1006, 'BLAKE', 'f', 30, 'MANAGER', 2850, '1997-02-15'),
         (1007, 'CLARK', 'm', 10, 'MANAGER', 2450, '2002-09-12'),
         (1008, 'SCOTT', 'm', 20, 'ANALYST', 3000, '2003-05-12'),
         (1009, 'KING', 'f', 10, 'PRESIDENT', 5000, '1995-01-01'),
         (1010, 'TURNER', 'f', 30, 'SALESMAN', 1500, '1997-10-12'),
         (1011, 'ADAMS', 'm', 20, 'CLERK', 1100, '1999-10-05'),
         (1012, 'JAMES', 'm', 30, 'CLERK', 950, '2008-06-15');
  -- 在employee表中，查询所有记录的e_no、e_name和e_salary字段值。
  -- 在employee表中，查询dept_no等于10和20的所有记录。
  -- 在employee表中，查询工资范围在800~2500之间的员工信息。
  -- 在employee表中，查询部门编号为20的部门中的员工信息。
  -- 在employee表中，查询每个部门最高工资的员工信息。
  SELECT e_no,e_name,e_salary from employee;
  SELECT * FROM employee WHERE dept_no in (10,20);
  SELECT * FROM employee where e_salary BETWEEN 800 AND 2500;
  SELECT * FROM employee WHERE dept_no = 20;
  SELECT * from employee WHERE e_salary in(SELECT SUM(e_salary) FROM employee GROUP BY e_job);




  SELECT *
  FROM employee e
  WHERE e.e_salary =
        (SELECT max(ei.e_salary) FROM employee ei WHERE ei.dept_no = 20);

  -- employee 附加最大工资的列
  SELECT e.*, (SELECT max(ei.e_salary) FROM employee ei WHERE e.dept_no = ei.dept_no) max
  FROM employee e;

  -- 在employee表中，计算每个部门各有多少名员工。
  -- 在employee表中，计算不同类型职工的总工资数。
  -- 在employee表中，计算不同部门的平均工资。
  -- 在employee表中，查询工资低于1500的员工信息。
  -- 在employee表中，将查询记录先按部门编号由高到低排列，再按员工工资由高到低排列。
  -- 在employee表中，查询员工姓名以字母’A’或’S’开头的员工的信息。
  -- 在employee表中，查询到目前为止，工龄大于等于10年的员工信息。
  SELECT * from employee WHERE e_no SUM(SELECT * FROM employee GROUP BY dept_no);
  SELECT SUM(e_salary),e_job from employee GROUP BY e_job;
  SELECT AVG(e_salary),dept_no from employee GROUP BY dept_no;
  SELECT * FROM employee WHERE e_salary <= 1500;
  SELECT dept_no,e_salary FROM employee ORDER BY dept_no DESC,e_salary DESC;
  SELECT * FROM employee WHERE e_name like 'A%'OR e_name LIKE'S%';
  SELECT * FROM employee WHERE (DATA - hireDate)>= 10;




  CREATE TABLE customers
  (
      c_id      int       NOT NULL AUTO_INCREMENT,
      c_name    char(50)  NOT NULL,
      c_address char(50)  NULL,
      c_city    char(50)  NULL,
      c_zip     char(10)  NULL,
      c_contact char(50)  NULL,
      c_email   char(255) NULL,
      PRIMARY KEY (c_id)
  );

  INSERT INTO customers(c_id, c_name, c_address, c_city,
                        c_zip, c_contact, c_email)
  VALUES (10001, 'RedHook', '200 Street ', 'Tianjin',
          '300000', 'LiMing', 'LMing@163.com'),
         (10002, 'Stars', '333 Fromage Lane',
          'Dalian', '116000', 'Zhangbo', 'Jerry@hotmail.com'),
         (10003, 'Netbhood', '1 Sunny Place', 'Qingdao', '266000',
          'LuoCong', NULL),
         (10004, 'JOTO', '829 Riverside Drive', 'Haikou',
          '570000', 'YangShan', 'sam@hotmail.com');

  -- 查询customers表中c_email为空的记录的c_id、c_name和c_email字段值
  -- 查询customers表中c_email不为空的记录的c_id、c_name和c_email字段值
  -- 在fruits表中查询s_id = 101，并且f_price大于等于5的水果价格和名称
  -- 在fruits表中查询s_id = 101或者102，且f_price大于5，并且f_name=‘apple’的水果价格和名称
  -- 查询s_id=101或者s_id=102的水果供应商的f_price和f_name
  -- 查询s_id=101或者s_id=102的水果供应商的f_price和f_name
  -- 查询fruits表中s_id字段的值，返回s_id字段值且不得重复
  -- 查询fruits表的f_name字段值，并对其进行排序
  -- 查询fruits表中的f_name和f_price字段，先按f_name排序，再按f_price排序
  -- 查询fruits表中的f_name和f_price字段，对结果按f_price降序方式排序
  -- 查询fruits表，先按f_price降序排序，再按f_name字段升序排序
  -- 根据s_id对fruits表中的数据进行分组
  -- 根据s_id对fruits表中的数据进行分组，将每个供应商的水果名称显示出来
  -- 根据s_id对fruits表中的数据进行分组，并显示水果种类大于1的分组信息
  -- 根据s_id对fruits表中的数据进行分组，并显示记录数量
  -- 根据s_id和f_name字段对fruits表中的数据进行分组， SQL语句如下，
  SELECT c_id,c_name,c_email from customers WHERE c_email IS NULL;
  SELECT c_id,c_name,c_email from customers WHERE c_email IS NOT NULL;
  SELECT f_price,f_name FROM fruits WHERE s_id = 101 and f_price >= 5;
  SELECT f_price,f_name FROM fruits WHERE s_id in (101,102) and f_price >= 5 and f_name = 'apple';
  SELECT f_price,f_name FROM fruits WHERE s_id in (101,102);
  SELECT DISTINCT s_id FROM fruits;
  SELECT * from fruits ORDER BY f_name DESC;
  SELECT * from fruits ORDER BY f_name ASC;
  SELECT f_name,f_price FROM fruits ORDER BY f_name ASC,f_price DESC;
  SELECT f_name,f_price FROM fruits ORDER BY f_price DESC;
  SELECT s_id FROM fruits GROUP BY s_id;
  SELECT s_id, GROUP_CONCAT(f_name) AS Names 
  FROM fruits GROUP BY s_id;
  SELECT s_id, GROUP_CONCAT(f_name) AS Names 
  FROM fruits 
  GROUP BY s_id HAVING COUNT(f_name) > 1;
  SELECT s_id, COUNT(*) AS Total 
  FROM fruits 
  GROUP BY s_id WITH ROLLUP;
   SELECT * FROM fruits group by s_id,f_name;







  CREATE TABLE orderitems
  (
      o_num      int           NOT NULL,
      o_item     int           NOT NULL,
      f_id       char(10)      NOT NULL,
      quantity   int           NOT NULL,
      item_price decimal(8, 2) NOT NULL,
      PRIMARY KEY (o_num, o_item)
  );

  INSERT INTO orderitems(o_num, o_item, f_id, quantity, item_price)
  VALUES (30001, 1, 'a1', 10, 5.2),
         (30001, 2, 'b2', 3, 7.6),
         (30001, 3, 'bs1', 5, 11.2),
         (30001, 4, 'bs2', 15, 9.2),
         (30002, 1, 'b3', 2, 20.0),
         (30003, 1, 'c0', 100, 10),
         (30004, 1, 'o2', 50, 2.50),
         (30005, 1, 'c0', 5, 10),
         (30005, 2, 'b1', 10, 8.99),
         (30005, 3, 'a2', 10, 2.2),
         (30005, 4, 'm1', 5, 14.99);

  -- 查询订单价格大于100的订单号和总订单价格
  SELECT o_num,  SUM(quantity * item_price) AS orderTotal
  FROM orderitems
  GROUP BY o_num
  HAVING SUM(quantity*item_price) >= 100;
  -- 将以上内容使用ORDER BY关键字按总订单价格排序显示结果
  SELECT o_num,  SUM(quantity * item_price) AS orderTotal
  FROM orderitems
  GROUP BY o_num
  HAVING SUM(quantity*item_price) >= 100
  ORDER BY orderTotal;
  -- 显示fruits表查询结果的前4行
  SELECT * From fruits LIMIT 4;
  -- 在fruits表中，使用LIMIT子句，返回从第5个记录开始的，行数长度为3的记录
  SELECT * From fruits LIMIT 4, 3;
  -- 查询customers表中总的行数
   SELECT COUNT(*) AS cust_num 
       FROM customers;
  -- 查询customers表中有电子邮箱的顾客的总数
   SELECT COUNT(c_email) AS email_num
       FROM customers;
  -- 在orderitems表中，使用COUNT()函数统计不同订单号中订购的水果种类
   SELECT o_num, COUNT(f_id)
       FROM orderitems 
       GROUP BY o_num;
  -- 在orderitems表中查询30005号订单一共购买的水果总量
  SELECT SUM(quantity) AS items_total
       FROM orderitems
       WHERE o_num = 30005;
  -- 在orderitems表中，使用SUM()函数统计不同订单号中订购的水果总量
  SELECT o_num, SUM(quantity) AS items_total
       FROM orderitems
       GROUP BY o_num;
  -- 在fruits表中，查询s_id=103的供应商的水果价格的平均值
  SELECT AVG(f_price) AS avg_price
       FROM fruits
       WHERE s_id = 103;
  -- 在fruits表中，查询每一个供应商的水果价格的平均值
  SELECT s_id,AVG(f_price) AS avg_price
        FROM fruits
        GROUP BY s_id;
  -- 在fruits表中查找市场上价格最高的水果
  SELECT MAX(f_price) AS max_price FROM fruits;
  -- 在fruits表中查找不同供应商提供的价格最高的水果
   SELECT s_id, MAX(f_price) AS max_price
        FROM fruits
   GROUP BY s_id;
  -- 在fruits表中查找f_name的最大值
  SELECT MAX(f_name) FROM fruits;
  -- 在fruits表中查找市场上价格最低的水果
  SELECT MIN(f_price) AS min_price FROM fruits;
  -- 在fruits表中查找不同供应商提供的价格最低的水果
  SELECT s_id, MIN(f_price) AS min_price
       FROM fruits
       GROUP BY s_id;
