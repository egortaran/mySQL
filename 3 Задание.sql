-- Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

SELECT id, 
	   (SELECT c.name 
	    FROM cities c 
	    WHERE label = f.from_
	   ) as 'from',
	   (SELECT c.name 
	    FROM cities c 
	    WHERE label = f.to_
	   ) as 'to'
FROM flights f;
