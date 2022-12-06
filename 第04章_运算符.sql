# 第 04 章_运算符

# 1.算数运算符 + - % / div % mod

SELECT 100,100+0,100-0,100+50-30,100+35.5,100-35.5
FROM DUAL;


SELECT 100 + '1' # 101
FROM DUAL


SELECT 100 + 'a' # 100  + 0 = 100
FROM DUAL


SELECT 100 + NULL # null
FROM DUAL


SELECT 100,100*1,100*1.0,100/1.0,100/2,
100+2*5/2,100/3,100 DIV 0                 # 分母为0 结果为null
FROM DUAL



# 取模运算
SELECT 12 %3 ,12 % 5,12 MOD -5,-12 % 5,-12 % -5
FROM DUAL;


# 查询员工id为偶数的员工信息
SELECT employee_id,last_name,salary
FROM employees
WHERE employee_id % 2 = 0;

# 2.比较运算符
# 2.1 = <=> <> != < <= > >=
SELECT 1=2,1!= 2,1='1',1='a',0='a'  # 字符串转换数值不成功 看作 0
FROM DUAL;

SELECT 'a' = 'a', 'ab' = 'ab', 'a' = 'b' # 两边都是字符 比较 编码
FROM DUAL;

SELECT 1 = NULL, NULL = NULL   # 只要有null结果就是null
FROM DUAL;

SELECT last_name,salary
FROM employees
WHERE salary = 6000;


SELECT last_name,salary,commission_pct
FROM employees
WHERE commission_pct = NULL;

# <=>: 安全等于
SELECT 1 <=> 2,1 <=> '1',1 <=> 'a',0 <=>'a'
FROM DUAL;


SELECT 1 <=> NULL, NULL <=> NULL 
FROM DUAL;

# 查询某一字段结果为null的数据
SELECT last_name,salary,commission_pct
FROM employees
WHERE commission_pct <=> NULL;


SELECT 3 <> 2,'4' <> NULL,'' != NULL,NULL != NULL
FROM DUAL;

# 2.2
# IS NULL \ IS NOT NULL \ ISNULL
SELECT last_name,salary,commission_pct
FROM employees
WHERE commission_pct IS NULL;

SELECT last_name,salary,commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;


SELECT last_name,salary,commission_pct
FROM employees
WHERE ISNULL(commission_pct);

# 筛选某字段非 null 的值
SELECT last_name,salary,commission_pct
FROM employees
WHERE NOT commission_pct <=> NULL;

# LEAST() \ GREATEST
SELECT LEAST('g','b','t','m'),GREATEST('g','b','t','m')
FROM DUAL;


SELECT LEAST(first_name,last_name),LEAST(LENGTH(first_name),LENGTH(last_name))
FROM employees;

# BETWEEN ... AND
# 查询工资在6000到8000的员工信息
SELECT employee_id,last_name,salary
FROM employees
WHERE salary BETWEEN 6000 AND 8000;   # 左闭右闭
# where salary>=6000 && salary <=8000;   


# 查询工资不在在6000到8000的员工信息
SELECT employee_id,last_name,salary
FROM employees
WHERE salary NOT BETWEEN 6000 AND 8000; 
# where salary<6000 or salary > 8000;   


# in (set) \ not in (set)
# 练习： 查询部门为10，20，30部门的员工信息
SELECT last_name,salary,department_id
FROM employees
# where department_id = 10 or department_id = 20 or department_id  = 30;
WHERE department_id IN (10,20,30);

# 练习： 查询工资不是6000，7000，8000的员工信息
SELECT last_name,salary,department_id
FROM employees
WHERE salary NOT IN (6000,7000,8000)

# LIKE ： 模糊查询
# 练习： last_name 中包含字符 'a' 的员工的信息

SELECT last_name
FROM employees
# where last_name like '%a%';
WHERE last_name LIKE 'a%';   # 以 a 开头的

# 练习: 查询last_name中包含字符'a'且包含字符'e'的员工信息
# 写法1:

SELECT last_name
FROM employees
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%';

# 写法2:

SELECT last_name
FROM employees
WHERE last_name LIKE '%a%e%' OR last_name LIKE '%e%a%';

# _:代表一个不确定的字符

# 查询第3个字符是'a'的员工信息
SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';



# 查询第2个字符是'_'第三个字符是'a'的员工信息
# 使用转义字符
SELECT last_name
FROM employees
WHERE last_name LIKE '_\_a%';

# REGEXP \ RLIKE : 正则表达式

SELECT 'shkstart' REGEXP '^s', 'shkstart' REGEXP 't$', 'shkstart' REGEXP 'hk'
FROM DUAL;


SELECT 'atguigu' REGEXP 'gu.gu', 'atguigu' REGEXP '[ab]'
FROM DUAL;

# 3. 逻辑运算符: OR || AND  && NOT ! XOR
SELECT last_name,salary,department_id
FROM employees
WHERE department_id = 50 AND salary > 6000;

# not
SELECT last_name,salary,department_id
FROM employees
WHERE commission_pct IS NOT NULL;
 
# XOR: 2 选 1
SELECT last_name,salary,department_id
FROM employees
WHERE department_id = 50 XOR salary > 6000;


# 位运算符: & | ^ ~ >> <<
SELECT 12 & 5, 12 | 5, 12 ^ 5  #二进制
FROM DUAL;

SELECT 10 & ~1 FROM DUAL;


SELECT 4 << 1, 8 >> 1
FROM DUAL;
