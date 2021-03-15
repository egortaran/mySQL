SELECT DAYNAME(DATE_FORMAT(birthday_at, '2021-%m-%d')) AS week, COUNT(*) FROM users GROUP BY week ORDER BY COUNT(*);
