--Задание Вывести фамилию с инициалами и общую сумму суточных, полученных за все командировки для тех сотрудников, которые были в командировках больше чем 3 раза, в отсортированном по убыванию сумм суточных виде. Последний столбец назвать Сумма.

--Только для этого задания изменена строка таблицы trip:

--4	Ильиных Г.Р.	Владивосток	450	2020-01-12	2020-03-02
--Результат
select name, sum((datediff(date_last,date_first)+1)*per_diem) as Сумма
from trip
group by name
having count(name) >3
order by Сумма desc;
+---------------+----------+
| name          | Сумма    |
+---------------+----------+
| Абрамова К.А. | 29200.00 |
| Баранов П.Е.  | 21300.00 |
+---------------+----------+
--Связанные шаги
--выборка столбцов;
--вычисления в SELECT;
--вычисления над сгруппированными данными;
--условие отбора в запросах группировки;
--вложенные запросы;
--сортировка.