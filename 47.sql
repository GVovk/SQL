--Поиск по ключевым словам
--На данном шаге можно найти шаги курса, в которых встречаются ключевые слова SQL, которые рассматриваются в курсе.

--Для этого скопируйте один из запросов в окно решений, укажите нужные ключевые слова и запустите запрос. В окне решений будут выведены ссылки на соответствующие шаги.

--Это НЕ ЗАДАНИЕ, а просто запросы, с помощью которых можно найти шаги, в которых встречаются те или иные ключевые слова. Выполнять не обязательно (это задание оценивается в 0 баллов). Это ПРОСТО ПОМОЩЬ для навигации по курсу.

--Запрос 1. Поиск шагов, в которых встречается заданное ключевое слово, в примере MAX:

SELECT 
   CONCAT(module_id,'.',lesson_position,".",step_position," ", CONCAT(LEFT(step_name, 50), '...')) AS Шаг,
   note AS Примечание
FROM step
        INNER JOIN lesson USING(lesson_id)
        INNER JOIN module USING(module_id)
        INNER JOIN step_keyword USING(step_id)
        INNER JOIN keyword USING(keyword_id)
WHERE keyword_name = 'MAX'
ORDER BY 1;
--Запрос 2. Поиск шагов, в которых встречаются два заданных ключевых слова одновременно, в примере MAX и AVG:

SELECT 
   CONCAT(module_id,'.',lesson_position,".",step_position," ", CONCAT(LEFT(step_name, 30), '...')) AS Шаг, 
   link AS Ссылка_на_шаг
FROM step
        INNER JOIN lesson USING(lesson_id)
        INNER JOIN module USING(module_id)
        INNER JOIN step_keyword USING(step_id)
        INNER JOIN keyword USING(keyword_id)
WHERE keyword_name IN ('MAX', 'AVG')
GROUP BY ШАГ, Ссылка_на_шаг
HAVING count(*) = 2
ORDER BY 1;
--Запрос 3. Поиск шагов, в которых встречаются три заданных ключевых слова одновременно, в примере MAX, MIN и AVG:

SELECT 
   CONCAT(module_id,'.',lesson_position,".",step_position," ",step_name) AS Шаг
FROM step
        INNER JOIN lesson USING(lesson_id)
        INNER JOIN module USING(module_id)
        INNER JOIN step_keyword USING(step_id)
        INNER JOIN keyword USING(keyword_id)
WHERE keyword_name IN ('MAX', 'AVG', 'MIN')
GROUP BY ШАГ
HAVING COUNT(*) = 3
ORDER BY 1;
