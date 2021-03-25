-- Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

CREATE VIEW ProductsCatalogs AS
SELECT products.name AS product_name,
		catalogs.name AS catalog_name
FROM products INNER JOIN catalogs ON products.catalog_id = catalogs.id 
;
