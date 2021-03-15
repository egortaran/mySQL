--Условие задания:
ALTER TABLE users MODIFY birthday_at VARCHAR(30);
UPDATE users SET birthday_at = DATE_FORMAT(birthday_at, '%Y-%M-%e');
--Выполнение:
SELECT name, birthday_at FROM users WHERE DATE_FORMAT(STR_TO_DATE(birthday_at, '%Y-%M-%e'), '%M') in ('May', 'August');
