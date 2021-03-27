-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT u.name 
FROM users u JOIN orders o
ON u.id = o.user_id
GROUP BY name ;
