--Задание Вывести сумму суточных (произведение количества дней командировки и размера суточных) для командировок, первый день которых пришелся на февраль или март 2020 года. Значение суточных для каждой командировки занесено в столбец per_diem. Вывести фамилию и инициалы сотрудника, город, первый день командировки и сумму суточных. Последний столбец назвать Сумма. Информацию отсортировать сначала  в алфавитном порядке по фамилиям сотрудников, а затем по убыванию суммы суточных.

--Пояснение
--1. В SQL есть функции, которые позволяют выделить часть даты: день(DAY()), месяц (MONTH()), год(YEAR()) . Например:

--DAY('2020-02-01') = 1
--MONTH('2020-02-01') = 2
--YEAR('2020-02-01') = 2020
--2. Количество дней командировки вычисляется как разница между датами последнего и первого дня командировки плюс 1.

--Результат
select name, city, date_first, (datediff (date_last, date_first)+1) * per_diem as Сумма 
from trip
where MONTH(date_first) = 02 or MONTH(date_first) = 03
order by name asc, Сумма desc; 

--Связанные шаги
--выборка столбцов и их именование;
--вычисления в SELECT;
--вычитание дат;
--выделение номера месяца из даты;
--условие отбора;
--сортировка.