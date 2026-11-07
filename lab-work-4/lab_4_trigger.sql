-- Підготовка таблиці: додаємо колонку для фіксації часу змінення
ALTER TABLE `Products`
ADD COLUMN `updated_at` TIMESTAMP NULL DEFAULT NULL
AFTER `category_id`;

-- Скрипт створення тригера
DELIMITER //

CREATE TRIGGER `trg_Products_BeforeUpdate`
BEFORE UPDATE ON `Products`
FOR EACH ROW
BEGIN
    SET NEW.updated_at = NOW();
END //

DELIMITER ;

-- Перевірка: Крок А - стан товару до зміни ціни (updated_at = NULL)
SELECT `id`, `name`, `price`, `updated_at` 
FROM `Products` 
WHERE `id` = 2;

-- Перевірка: Крок Б - оновлння ціни (ця дія активує тригер)
UPDATE `Products`
SET `price` = 190.00
WHERE `id` = 2;

-- Перевірка: Крок В - стан товару після оновлення (updated_at заповнений поточним часом)
SELECT `id`, `name`, `price`, `updated_at` 
FROM `Products` 
WHERE `id` = 2;