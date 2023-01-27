--Задание
--Вывести информацию о командировках, начало и конец которых относятся к одному месяцу (год может быть любой). В результат включить столбцы name, city, date_first, date_last. Строки отсортировать сначала  в алфавитном порядке по названию города, а затем по фамилии сотрудника .

--Немного теории

--Для того, чтобы выделить номер месяца из даты используется функция MONTH(дата).

--Например, MONTH('2020-04-12') = 4.

--Если определяется месяц для  значений столбца date_first, то используется запись MONTH(date_first)

--Результат
select name, city, date_first, date_last from trip
where MONTH(date_first) = MONTH(date_last)
order by city asc, name asc
+---------------+-----------------+------------+------------+
| name          | city            | date_first | date_last  |
+---------------+-----------------+------------+------------+
| Абрамова К.А. | Владивосток     | 2020-01-14 | 2020-01-27 |
| Абрамова К.А. | Владивосток     | 2020-07-02 | 2020-07-13 |
| Баранов П.Е.  | Воронеж         | 2020-07-19 | 2020-07-25 |
| Абрамова К.А. | Москва          | 2020-04-06 | 2020-04-14 |
| Баранов П.Е.  | Москва          | 2020-01-12 | 2020-01-17 |
| Баранов П.Е.  | Москва          | 2020-02-14 | 2020-02-22 |
| Колесов С.П.  | Москва          | 2020-02-01 | 2020-02-06 |
| Лебедев Т.К.  | Москва          | 2020-03-03 | 2020-03-06 |
| Семенов И.В.  | Москва          | 2020-01-23 | 2020-01-31 |
| Колесов С.П.  | Новосибирск     | 2020-06-03 | 2020-06-12 |
| Семенов И.В.  | Санкт-Петербург | 2020-06-01 | 2020-06-03 |
| Лебедев Т.К.  | Томск           | 2020-05-20 | 2020-05-31 |
| Федорова А.Ю. | Томск           | 2020-06-20 | 2020-06-26 |
+---------------+-----------------+------------+------------+
--Связанные шаги
--выборка столбцов;
--условие отбора;
--сортировка.