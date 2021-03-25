-- Пусть имеется любая таблица с календарным полем created_at.
-- Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

DELETE FROM test 
WHERE created_at IN (SELECT created_at FROM(
	SELECT TableA.created_at 
	FROM test AS TableA
	LEFT OUTER JOIN (SELECT * FROM test ORDER BY created_at DESC LIMIT 5) as  TableB
	ON TableA.created_at = TableB.created_at
	WHERE TableB.created_at IS NULL) as x
);
