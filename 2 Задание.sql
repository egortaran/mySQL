-- Выведите список товаров products и разделов catalogs, который соответствует товару.
-- Честно говоря, плохо понял смысл задания, если оно решено неверно, то напишите, пожалуйста, в телеграм @Taran_27

SELECT p.name, c.name
FROM products p JOIN catalogs c 
ON p.catalog_id = c.id ;
