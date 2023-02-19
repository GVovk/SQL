--Задание
--В таблице fine увеличить в два раза сумму неоплаченных штрафов для отобранных на предыдущем шаге записей. 

--Пояснение !!! если не получается запрос или валидатор выдает ошибки, раскройте это пояснение!!!
--Для всех нарушений, по которым штраф еще не оплачен, (тех, у которых date_payment имеет пустое значение Null), необходимо проверить, является ли данное нарушение для водителя и машины повторным, если да –  увеличить штраф в два раза.
--Если водитель совершил нарушение на другой машине, ему увеличивать штраф не нужно.
--Если несколько повторных нарушений не оплачены, то штраф увеличить для всех.
--Этот запрос реализован на предыдущем шаге.
--При реализации можно использовать вложенный запрос как отдельную таблицу, записанную после ключевого слова UPDATE, при этом вложенному запросу необходимо присвоить имя, например query_in:

UPDATE fine, 
    (
     SELECT ...
    ) query_in
SET ...
WHERE указать, что совпадают нарушение, фамилия водителя и номер машины в таблицах fine и вложенном запросе query_in соответственно, а также дата оплаты в таблице fine пуста
--Другим способом решения является использование двух запросов: сначала создать временную таблицу, например query_in, в которую включить информацию о тех штрафах, сумму которых нужно увеличить в два раза, а затем уже обновлять информацию в таблице fine:

CREATE TABLE query_in ...;

UPDATE fine, query_in
SET ...
WHERE ...;
--После ключевого слова WHERE  указывается условие, при котором нужно обновлять данные. В нашем случае  данные обновляются, если и фамилия, и государственный номер, и нарушение совпадают в таблице fine и в результирующей таблице запроса query_in. Например, для связи по фамилии используется запись fine.name = query_in.name. Также в условии нужно учесть, что данные обновляются только для тех записей, у которых в столбце date_payment пусто.

--Важно! Если в запросе используется несколько таблиц или запросов, включающих одинаковые поля, то применяется полное имя столбца, включающего название таблицы через символ «.». Например,  fine.name  и  query_in.name.

--Результат
update fine, (select name, number_plate, violation
from fine group by name, number_plate, violation
having count(violation)>1 ) as query_in
set sum_fine = sum_fine*2
where date_payment is null and
fine.name = query_in.name and
fine.number_plate = query_in.number_plate and
fine.violation = query_in.violation;

Affected rows: 2

Query result:
+---------------+--------------+----------------------------------+----------+------------------+--------------+
| name          | number_plate | violation                        | sum_fine | date_violation   | date_payment |
+---------------+--------------+----------------------------------+----------+------------------+--------------+
| Баранов П.Е.  | Р523ВТ       | Превышение скорости(от 40 до 60) | 500.00   | 2020-01-12       | 2020-01-17   |
| Абрамова К.А. | О111АВ       | Проезд на запрещающий сигнал     | 1000.00  | 2020-01-14       | 2020-02-27   |
| Яковлев Г.Р.  | Т330ТТ       | Превышение скорости(от 20 до 40) | 500.00   | 2020-01-23       | 2020-02-23   |
| Яковлев Г.Р.  | М701АА       | Превышение скорости(от 20 до 40) | 500.00   | 2020-01-12       | NULL        |
| Колесов С.П.  | К892АХ       | Превышение скорости(от 20 до 40) | 500.00   | 2020-02-01       | NULL         |
| Баранов П.Е.  | Р523ВТ       | Превышение скорости(от 40 до 60) | 2000.00  | 2020-02-14       | NULL         |
| Абрамова К.А. | О111АВ       | Проезд на запрещающий сигнал     | 2000.00  | 2020-02-23       | NULL         |
| Яковлев Г.Р.  | Т330ТТ       | Проезд на запрещающий сигнал     | 1000.00  | 2020-03-03       | NULL         |
+---------------+--------------+----------------------------------+----------+------------------+--------------+