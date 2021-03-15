--Условие задания:
CREATE TABLE `lesson-5`.test (value INT NULL);
INSERT INTO test VALUES (1),(2),(3),(4),(5);
--Выполнение:
SELECT exp(SUM(log(value))) product FROM test;
  
