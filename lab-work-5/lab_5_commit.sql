-- 1. Перевірка стану товару "ДО" транзакції
SELECT `id`, `name`, `price` FROM `Products` WHERE `id` = 1;

-- 2. Початок транзакції
START TRANSACTION;

-- 3. Оновлення ціни товару
UPDATE `Products`
SET `price` = 175.00
WHERE `id` = 1;

-- 4. Фіксація змін
COMMIT;

-- 5. Перевірка стану товару "ПІСЛЯ" транзакції
SELECT `id`, `name`, `price` FROM `Products` WHERE `id` = 1;