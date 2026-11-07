-- Створення представлення для формування звіту про замовлення

CREATE VIEW `v_Detailed_Orders` AS
SELECT
    o.id AS `order_id`,
    o.status AS `order_status`,
    o.created_at AS `order_date`,
    u.name AS `customer_name`,
    u.email AS `customer_email`,
    p.name AS `product_name`,
    p.price AS `product_price`,
    oi.quantity,
    oi.price_at_purchase
FROM
    `Orders` AS o
JOIN
    `Users` AS u ON o.user_id = u.id
JOIN
    `Order_Items` AS oi ON o.id = oi.order_id
JOIN
    `Products` AS p ON oi.product_id = p.id
ORDER BY
    o.id DESC;

-- Перевірка роботи представлення
SELECT * FROM `v_Detailed_Orders`;
