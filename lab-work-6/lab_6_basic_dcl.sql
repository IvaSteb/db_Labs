-- Використовуємо нашу навчальну базу даних
USE `plants_shop`;

-- Створюємо нового користувача 'web_client' для локального підключення
CREATE USER IF NOT EXISTS 'web_client'@'localhost' IDENTIFIED BY 'secure_pass_123';

-- Надаємо право ТІЛЬКИ на перегляд (SELECT) таблиці товарів Products
GRANT SELECT ON `plants_shop`.`Products` TO 'web_client'@'localhost';

-- Застосовуємо зміни привілеїв
FLUSH PRIVILEGES;

-- Перевіряємо видані права користувача
SHOW GRANTS FOR 'web_client'@'localhost';
