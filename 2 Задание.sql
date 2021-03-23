-- Выведите список товаров products и разделов catalogs, который соответствует товару.
-- Честно говоря, плохо понял смысл задания, если оно решено неверно, то напишите, пожалуйста, в телеграм @Taran_27

SELECT id, name, (SELECT c.name 
		  FROM catalogs c 
		  WHERE c.id = p.catalog_id 
		 )as 'catalog'	
FROM products p ;
