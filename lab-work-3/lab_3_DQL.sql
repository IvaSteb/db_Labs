-- Крок 7
-- Фільтрація з поєднанням операторів WHERE, AND та OR
-- Знайти рослини з 1-ї або 2-ї категорії з ціною менше 400 грн
SELECT *
FROM `Products`
WHERE (`category_id` = 1 OR `category_id` = 2) 
  AND `price` < 400.00;

-- Крок 8
-- Фільтрація за списком значень через оператор IN
-- Вивести замовлення, які мають статус 'completed' або 'shipped'
SELECT *
FROM `Orders`
WHERE `status` IN ('completed', 'shipped');

-- Крок 9
-- Пошук за текстовим шаблоном через оператор LIKE
-- Знайти користувачів з поштовою адресою на домені @gmail.com
SELECT *
FROM `Users`
WHERE `email` LIKE '%@gmail.com';

-- Крок 10
-- Сортування результатів вибірки через ORDER BY
-- Вивести товари за категоріями (ASC), а всередині — за спаданням ціни (DESC)
SELECT `id`, `name`, `category_id`, `price`, `stock_quantity`
FROM `Products`
ORDER BY `category_id` ASC, `price` DESC;