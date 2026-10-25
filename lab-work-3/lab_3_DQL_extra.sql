
-- Крок 1. Базова аналітика та агрегатні функції по каталогу товарів
-- Використання: COUNT, AVG, SUM, MIN, MAX
SELECT 
    COUNT(*) AS total_products_count,
    ROUND(AVG(price), 2) AS average_price,
    SUM(stock_quantity) AS total_stock,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM 
    Products;

-- Крок 2. Агрегація з групуванням (GROUP BY + JOIN)
-- Порахувати загальну суму покупок (витрат) для кожного клієнта
SELECT
    u.name,
    SUM(oi.quantity * oi.price_at_purchase) AS total_spent
FROM
    Users AS u
JOIN
    Orders AS o ON u.id = o.user_id
JOIN
    Order_Items AS oi ON o.id = oi.order_id
GROUP BY
    u.id, u.name
ORDER BY
    total_spent DESC;

-- Крок 3. Фільтрація агрегованих результатів (HAVING)
-- Вивести клієнтів, сума покупок яких перевищує 500 грн
SELECT
    u.name,
    SUM(oi.quantity * oi.price_at_purchase) AS total_spent
FROM
    Users AS u
JOIN
    Orders AS o ON u.id = o.user_id
JOIN
    Order_Items AS oi ON o.id = oi.order_id
GROUP BY
    u.id, u.name
HAVING
    total_spent > 500
ORDER BY
    total_spent DESC;

-- Крок 4. Об'єднання 4 таблиць (INNER JOIN)
-- Звіт про продажі виконаних замовлень (клієнт, товар, к-сть, статус)
SELECT
    u.name AS customer_name,
    p.name AS product_name,
    oi.quantity,
    o.status
FROM
    Users AS u
INNER JOIN
    Orders AS o ON u.id = o.user_id
INNER JOIN
    Order_Items AS oi ON o.id = oi.order_id
INNER JOIN
    Products AS p ON oi.product_id = p.id
WHERE
    o.status = 'completed'
ORDER BY
    u.name;

-- Крок 5. Неповне зовнішнє об'єднання (LEFT JOIN)
-- Знайти всіх користувачів та їхні замовлення (якщо є)
-- Для клієнтів без замовлень значення в колонці order_id буде NULL
SELECT
    u.name AS customer_name,
    o.id AS order_id
FROM
    Users AS u
LEFT JOIN
    Orders AS o ON u.id = o.user_id
ORDER BY
    u.name;

-- Крок 6. Запит із вкладеним підзапитом (Subquery)
-- Знайти назви всіх товарів, які жодного разу не замовляли
SELECT
    p.name
FROM
    Products AS p
WHERE
    p.id NOT IN (
        SELECT DISTINCT oi.product_id
        FROM Order_Items AS oi
    );

-- Крок 7. Комбінування результатів вибірки (UNION)
-- Об'єднати імена клієнтів і назви категорій в єдиний перелік
SELECT
    u.name AS item_name,
    'User' AS item_type
FROM
    Users AS u
UNION
SELECT
    c.name AS item_name,
    'Category' AS item_type
FROM
    Categories AS c
ORDER BY
    item_type, item_name;