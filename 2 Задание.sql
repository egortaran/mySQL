SELECT from_user_id as 'Пользователь', to_user_id as 'Друг', SUM(count) as 'Сообщения' 
FROM(
	SELECT CASE 
		   		when from_user_id != 210 then to_user_id 
				when to_user_id then from_user_id
				end as 'from_user_id',
		   CASE 
			    when to_user_id = 210 then from_user_id 
				when from_user_id then to_user_id
				end as 'to_user_id',
		   COUNT(*) as count
	FROM messages m
	WHERE 
		from_user_id in (
	    	SELECT fr.initiator_user_id
	    	from friend_requests fr 
	    	where fr.status = 'approved' AND fr.initiator_user_id = 210
	  	)
	  OR 
	  	to_user_id in (
	  		SELECT fr.target_user_id
	    	from friend_requests fr 
	    	where fr.status = 'approved' AND fr.target_user_id = 210
	  	)
	GROUP BY from_user_id, to_user_id
)as results1
GROUP BY from_user_id, to_user_id
;

-- Можно было сделать кратко, но вот что-то совсем запутался.
-- 2 стр. - в таблице с помощью CASE я переместил 210 id в первый солбец, во второй стобец друзей,
-- кто получил или отправил сообщения 210 id, в третьем столбце кол-во сообщений
-- 13 стр. - фильтр идет по friend_requests.status = 'approved' для 1. Кто отправил заявку,
-- 2. Кто принял заявку.
