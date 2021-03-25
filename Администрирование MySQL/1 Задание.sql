-- Создайте двух пользователей которые имеют доступ к базе данных shop. 
-- Первому пользователю shop_read должны быть доступны только запросы на чтение данных, второму пользователю shop — любые операции в пределах базы данных shop.

CREATE USER 'shop'@'localhost' IDENTIFIED BY 'shop';
GRANT ALL ON *.* TO 'shop'@'localhost';

CREATE USER 'shop_read'@'localhost' IDENTIFIED BY 'shop_read';
GRANT SELECT ON *.* TO 'shop'@'localhost';
