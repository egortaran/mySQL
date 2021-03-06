#1 Задание.  
[client]  
user = root  
password = egor2757  

Место в хранилище:  
/etc/mysql/my.cnf  

#2 Задание
mysql> CREATE DATABASE example;  
mysql> USE example  
mysql> CREATE TABLE users (id INT, name VARCHAR(20));  

#3 Задание
mysqldump example > sample.sql  
mysql> CREATE DATABASE sample;  
mysql -f sample < sample.sql  

#4 Задание
mysqldump --where="true limit 100" mysql help_keyword > new_help_keyword.sql  
