-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT *
FROM users u
WHERE id in (
    SELECT o.user_id 
    FROM orders o 			
);
