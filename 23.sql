--Использование вложенного запроса в выражении
--Вложенный запрос, возвращающий одно значение, может использоваться в выражениях как обычный операнд, например, к нему можно что-то прибавить, вычесть и пр.

--Пример
--Вывести информацию о книгах, количество экземпляров которых отличается от среднего количества экземпляров книг на складе более чем на 3. То есть нужно вывести и те книги, количество экземпляров которых меньше среднего на 3, или больше среднего на 3.
--Запрос:

SELECT title, author, amount 
FROM book
WHERE ABS(amount - (SELECT AVG(amount) FROM book)) >3;
--функция ABS возвращает абсолютное значение числа, т.е. берет число по модулю. Синтаксис: ABS( number )
--Результат:
+-----------------------+------------------+--------+
| title                 | author           | amount |
+-----------------------+------------------+--------+
| Мастер и Маргарита    | Булгаков М.А.    | 3      |
| Братья Карамазовы     | Достоевский Ф.М. | 3      |
| Стихотворения и поэмы | Есенин С.А.      | 15     |
+-----------------------+------------------+--------+
--Задание. Вывести информацию (автора, название и цену) о тех книгах, цены которых превышают минимальную цену книги на складе не более чем на 150 рублей в отсортированном по возрастанию цены виде.
select  author,title, price
from book
where abs (price - (select min(price) from book))<=150
order by price asc
+------------------+----------------+--------+
| author           | title          | price  |
+------------------+----------------+--------+
| Достоевский Ф.М. | Идиот          | 460.00 |
| Достоевский Ф.М. | Игрок          | 480.50 |
| Булгаков М.А.    | Белая гвардия  | 540.50 |
| Пушкин А.С.      | Евгений Онегин | 610.00 |
+------------------+----------------+--------+