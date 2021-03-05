#1 Задание.
[client]
user = root
password = egor2757

/etc/mysql/my.cnf

#2 Задание
mysql> CREATE DATABASE example;
mysql> USE example
mysql> CREATE TABLE users (id INT, name VARCHAR(20));
mysql> DESCRIBE users;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+


#3 Задание
root@Taran:/var/lib/mysql# mysqldump example > sample.sql
mysql> CREATE DATABASE sample;
root@Taran:/var/lib/mysql# mysql -f sample < sample.sql
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| example            |
| information_schema |
| mysql              |
| performance_schema |
| sample             |
| sys                |
+--------------------+
mysql> USE sample
mysql> SHOW TABLES;
+------------------+
| Tables_in_sample |
+------------------+
| users            |
+------------------+
mysql> DESCRIBE users;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+