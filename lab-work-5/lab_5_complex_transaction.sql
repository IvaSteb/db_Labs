-- ПОЧАТОК ТРАНЗАКЦІЇ
START TRANSACTION;

-- КРОК 1: Створюємо саме замовлення (для користувача з id = 2)
INSERT INTO `Orders` (`user_id`, `status`)
VALUES (2, 'pending');

SET @new_order_id = LAST_INSERT_ID();

-- КРОК 2: Додаємо товар у замовлення (товар id = 4, 1 шт., ціна 950.00)
INSERT INTO `Order_Items` (`order_id`, `product_id`, `quantity`, `price_at_purchase`)
VALUES (@new_order_id, 4, 1, 950.00);

-- КРОК 3: Списуємо 1 одиницю товару зі складу
UPDATE `Products`
SET `stock_quantity` = `stock_quantity` - 1
WHERE `id` = 4;

-- КРОК 4: Фіксуємо всі зміни як єдину операцію
COMMIT;
