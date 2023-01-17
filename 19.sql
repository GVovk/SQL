--Вычисления по таблице целиком
--Групповые функции позволяют вычислять итоговые значения по всей таблице. Например, можно посчитать общее количество книг на складе, вычислить суммарную стоимость и пр. Для этого после ключевого слова SELECT указывается групповая функция для выражения или имени столбца, а ключевые слова GROUP BY опускаются.
--Пример
--Посчитать количество экземпляров книг на складе.
--Запрос:

SELECT SUM(amount) AS Количество
FROM book;
--Результат:

+------------+
| Количество |
+------------+
| 46         |
+------------+ 
--Результатом таких запросов является единственная строка с вычисленными по таблице значениями.
--Пример
--Посчитать общее количество экземпляров книг на складе и их стоимость .
--Запрос:

SELECT SUM(amount) AS Количество, 
    SUM(price * amount) AS Стоимость
FROM book;
--Результат:
+------------+-----------+
| Количество | Стоимость |
+------------+-----------+
| 46         | 26267.50  |
+------------+-----------+
--Задание
--Вывести  цену самой дешевой книги, цену самой дорогой и среднюю цену уникальных книг на складе. Названия столбцов Минимальная_цена, Максимальная_цена, Средняя_цена соответственно. Среднюю цену округлить до двух знаков после запятой.
--Пояснение. В задании нужно посчитать среднюю цену уникальных книг на складе, а не среднюю цену всех экземпляров книг.
select min(price) as Минимальная_цена, max(price) as Максимальная_цена, round(avg(price), 2) as Средняя_цена
from book
--результат
+------------------+-------------------+--------------+
| Минимальная_цена | Максимальная_цена | Средняя_цена |
+------------------+-------------------+--------------+
| 460.00           | 799.01            | 600.17       |
+------------------+-------------------+--------------+