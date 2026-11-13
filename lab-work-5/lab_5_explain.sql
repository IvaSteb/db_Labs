-- Крок 1. Аналіз "ДО" створення індексу
EXPLAIN SELECT * FROM `Products` WHERE `price` = 320.00;

-- Крок 2. Створення індексу для колонки price
CREATE INDEX `idx_products_price` ON `Products` (`price`);

-- Крок 3. Аналіз "ПІСЛЯ" створення індексу
EXPLAIN SELECT * FROM `Products` WHERE `price` = 320.00;