SELECT SUM(count) 
FROM (
	SELECT
		user_id, 
		(SELECT TIMESTAMPDIFF(YEAR, p.birthday , NOW())
		 FROM profiles p 
		 where p.user_id = l.user_id 
		)as age,
	 	COUNT(user_id) as 'count'
	FROM likes l
	group by user_id 
	ORDER BY age LIMIT 10
) as results1
;

-- 2 стр. - таблица состоит из user_id, лет user_id, кол-во лайков
