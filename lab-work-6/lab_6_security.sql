
-- Створюємо користувача 'app_backend'
CREATE USER IF NOT EXISTS 'app_backend'@'localhost' IDENTIFIED BY 'pass_secure_456';

-- Дозволяємо ТІЛЬКИ ЧИТАТИ товари, категорії та користувачів (для вітрини сайту)
GRANT SELECT ON `plants_shop`.`Products` TO 'app_backend'@'localhost';
GRANT SELECT ON `plants_shop`.`Categories` TO 'app_backend'@'localhost';
GRANT SELECT ON `plants_shop`.`Users` TO 'app_backend'@'localhost';

-- Дозволяємо переглядати та створювати замовлення і позиції чека
GRANT SELECT, INSERT ON `plants_shop`.`Orders` TO 'app_backend'@'localhost';
GRANT SELECT, INSERT ON `plants_shop`.`Order_Items` TO 'app_backend'@'localhost';

-- Оновлюємо таблицю привілеїв
FLUSH PRIVILEGES;

-- Перевіряємо призначені права
SHOW GRANTS FOR 'app_backend'@'localhost';