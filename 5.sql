--Занесите новую строку в таблицу book (текстовые значения (тип VARCHAR) заключать либо в двойные, либо в одинарные кавычки)

insert into book (book_id, title, author,price, amount) 
values (1, 'Мастер и Маргарита', 'Булгаков М.А.', 670.99, 3)
Результат:

Affected rows: 1
Query result:
+---------+--------------------+---------------+--------+--------+
| book_id | title              | author        | price  | amount |
+---------+--------------------+---------------+--------+--------+
| 1       | Мастер и Маргарита | Булгаков М.А. | 670.99 | 3      |
+---------+--------------------+---------------+--------+--------+

--Рекомендации по записи SQL запроса
--Ключевые слова: SQL не является регистрозависимым языком (CREATE и create - одно и тоже ключевое слово). 
--Ключевые слова SQL и типы данных рекомендуется  записывать прописными (большими) буквами.
--Имена таблиц и полей - строчными (маленькими) буквами.
--SQL-запрос можно писать на нескольких строках.
--В конце SQL-запроса ставится точка с запятой (хотя если Вы пишете один запрос, это необязательно).