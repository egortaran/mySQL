-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".


CREATE PROCEDURE hello ()
BEGIN
	IF DATE_FORMAT(NOW(), "%H:%i") >= STR_TO_DATE('6:00',"%H:%i") AND DATE_FORMAT(NOW(), "%H:%i") < STR_TO_DATE('12:00',"%H:%i") THEN
		SELECT 'Доброе утро' AS hello;
	END IF;
	IF DATE_FORMAT(NOW(), "%H:%i") >= STR_TO_DATE('12:00',"%H:%i")  AND DATE_FORMAT(NOW(), "%H:%i") < STR_TO_DATE('18:00',"%H:%i") THEN
		SELECT 'Добрый день' AS hello;
	END IF;
	IF DATE_FORMAT(NOW(), "%H:%i") >= STR_TO_DATE('18:00',"%H:%i") AND DATE_FORMAT(NOW(), "%H:%i") < STR_TO_DATE('24:00',"%H:%i") THEN
		SELECT 'Добрый вечер' AS hello;
	END IF;
	IF DATE_FORMAT(NOW(), "%H:%i") >= STR_TO_DATE('0:00',"%H:%i") AND DATE_FORMAT(NOW(), "%H:%i") < STR_TO_DATE('6:00',"%H:%i") THEN
		SELECT 'Доброй ночи' AS hello;
	END IF;
END;

call hello;	
