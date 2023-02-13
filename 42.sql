--Задание Создать таблицу fine следующей структуры:

--Поле	Описание
--fine_id	ключевой столбец целого типа с автоматическим увеличением значения ключа на 1
--name	строка длиной 30
--number_plate	строка длиной 6
--violation	строка длиной 50
--sum_fine	вещественное число, максимальная длина 8, количество знаков после запятой 2
--date_violation	дата
--date_payment	дата
--Результат
create table fine (
fine_id INT PRIMARY KEY AUTO_INCREMENT, 
name varchar (30),
number_plate varchar (6),
violation varchar (50),
--Вещественное число DECIMAL или NUMERIC,
в скобках указывается максимальная
длина числа (включает символы слева и справа от десятичной запятой)
и количество знаков после запятой.
sum_fine DECIMAL(8, 2),
date_violation DATE,    
date_payment DATE);

--Связанные шаги
--типы столбцов;
--создание таблицы (шаг, шаг).