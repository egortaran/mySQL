--Условие задания:
ALTER TABLE users MODIFY created_at VARCHAR(30);
UPDATE users SET created_at = '20.10.2017 8:10';
ALTER TABLE users MODIFY updated_at VARCHAR(30);
UPDATE users SET updated_at = '20.10.2017 8:10';
--Выполнение:
UPDATE users SET updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
ALTER TABLE users MODIFY updated_at DATETIME;
UPDATE users SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i');
ALTER TABLE users MODIFY updated_at DATETIME;
