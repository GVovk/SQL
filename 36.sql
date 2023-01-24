--Задание
--Вывести информацию о командировках во все города кроме Москвы и Санкт-Петербурга (фамилии и инициалы сотрудников, город ,  длительность командировки в днях, при этом первый и последний день относится к периоду командировки). Последний столбец назвать Длительность. Информацию вывести в упорядоченном по убыванию длительности поездки, а потом по убыванию названий городов (в обратном алфавитном порядке).

--Немного теории
--Для вычитания двух дат используется функция DATEDIFF(дата_1, дата_2), результатом которой является количество дней между дата_1 и дата_2. Например,

DATEDIFF('2020-04-01', '2020-03-28')=4

DATEDIFF('2020-05-09','2020-05-01')=8

DATEDIFF(date_last, date_first)

--!!!! Увеличьте разницу на 1, чтобы включить первый день командировки.

--Результат
select name, city,
(datediff (date_last, date_first)+1) as Длительность
from trip
where city not in ("Москва", "Санкт-Петербург")
order by Длительность desc, city desc
+---------------+-------------+--------------+
| name          | city        | Длительность |
+---------------+-------------+--------------+
| Ильиных Г.Р.  | Владивосток | 22           |
| Баранов П.Е.  | Новосибирск | 17           |
| Колесов С.П.  | Новосибирск | 15           |
| Абрамова К.А. | Владивосток | 14           |
| Лебедев Т.К.  | Томск       | 12           |
| Абрамова К.А. | Владивосток | 12           |
| Федорова А.Ю. | Новосибирск | 11           |
| Колесов С.П.  | Новосибирск | 10           |
| Федорова А.Ю. | Томск       | 7            |
| Баранов П.Е.  | Воронеж     | 7            |
+---------------+-------------+--------------+
--Связанные шаги
--выборка столбцов и их именование;
--условие отбора (шаг, шаг);
--сортировка.