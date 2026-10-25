-- Крок 2
-- Create (INSERT): Додавання нового клієнта в таблицю Users
INSERT INTO `Users` (`name`, `email`, `password_hash`) 
VALUES ('Віктор Павленко', 'viktor.pavlenko@gmail.com', 'hash_xyz_9');

-- Крок 3
-- Create (INSERT): Додавання нової рослини в таблицю Products
INSERT INTO `Products` (`name`, `description`, `price`, `stock_quantity`, `category_id`) 
VALUES ('Літопс ("Живий камінь")', 'Незвичайний сукулент, що імітує каміння, 5 см', 180.00, 15, 1);

-- Крок 4
-- Update (UPDATE): Модифікація ціни на конкретний товар
UPDATE `Products`
SET `price` = 220.00
WHERE `id` = 1;

-- Крок 5
-- Delete (DELETE): Видалення конкретної позиції із замовлення
DELETE FROM `Order_Items`
WHERE `order_id` = 1 AND `product_id` = 9;
