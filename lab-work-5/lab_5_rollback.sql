-- 1. Дивимося на ціну "ДО"
SELECT `id`, `name`, `price` FROM `Products` WHERE `id` = 2;

-- 2. Починаємо транзакцію
START TRANSACTION;

-- 3. Виконуємо нашу DML-операцію, яку ми хочемо скасувати
UPDATE `Products`
SET `price` = 999.00
WHERE `id` = 2;

-- 4. Переконуємося, що ціна змінилася - тільки для нас, всередині транзакції
SELECT `id`, `name`, `price` FROM `Products` WHERE `id` = 2;

-- 5. Завершуємо транзакцію та скасування змін
ROLLBACK;

-- 6. Дивимося на ціну "ПІСЛЯ"
SELECT `id`, `name`, `price` FROM `Products` WHERE `id` = 2;