SELECT gender, COUNT(gender) as 'count'
FROM (
	SELECT
		user_id,
		(SELECT gender
		 FROM profiles p
		 where p.user_id = l.user_id
		 ) as 'gender'
	FROM likes l
)as results1
group by gender 
ORDER by count DESC LIMIT 1
;

-- 2 стр. - таблица состоит из user_id и его пола
