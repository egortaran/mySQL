SELECT id, SUM(acts) as acts 
FROM 
  (SELECT id, 0 as acts 
   FROM users
UNION
   SELECT user_id as id, count(*) as acts 
   FROM media
   GROUP BY user_id
UNION
   SELECT user_id, COUNT(*) 
   FROM likes
   GROUP BY user_id
UNION
   SELECT from_user_id, COUNT(*) 
   FROM messages
   GROUP BY from_user_id) AS activ
GROUP BY id
ORDER BY acts LIMIT 10 
;
