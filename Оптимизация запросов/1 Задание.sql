-- Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи, 
-- название таблицы, идентификатор первичного ключа и содержимое поля name.

CREATE TABLE logs(
	created_at datetime DEFAULT CURRENT_TIMESTAMP,
	name_table varchar(20),
	id int,
	name varchar(20)
);

CREATE TRIGGER insert_logs_from_users AFTER INSERT ON users
FOR EACH ROW BEGIN
	INSERT INTO logs (name_table, id, name) 
		VALUES('users', NEW.id, NEW.name);
END;

CREATE TRIGGER insert_logs_from_products AFTER INSERT ON products
FOR EACH ROW BEGIN
	INSERT INTO logs (name_table, id, name) 
		VALUES('products', NEW.id, NEW.name);
END;

CREATE TRIGGER insert_logs_from_catalogs AFTER INSERT ON catalogs
FOR EACH ROW BEGIN
	INSERT INTO logs (name_table, id, name) 
		VALUES('catalogs', NEW.id, NEW.name);
END;
