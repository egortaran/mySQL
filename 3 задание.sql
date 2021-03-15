INSERT users(firstname, lastname, email) VALUES ('Egor', 'Taran', 'egortaran@mail.ru');
SELECT firstname, lastname FROM users;
UPDATE users SET id = 1 WHERE firstname = 'Egor';
DELETE FROM users WHERE firstname = 'Egor';

