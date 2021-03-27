-- Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

SELECT f.id, c1.name, c2.name 
FROM flights f JOIN cities c1 JOIN cities c2 
ON f.from_ = c1.label AND f.to_ = c2.label;
