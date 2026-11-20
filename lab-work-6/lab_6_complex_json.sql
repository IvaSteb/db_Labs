-- Отримуємо профіль користувача id = 1 та вкладений JSON-масив усіх його замовлень
SELECT 
    JSON_OBJECT(
        'user_id', u.`id`,
        'full_name', u.`name`,
        'email', u.`email`,
        'orders', CONCAT(
            '[',
            GROUP_CONCAT(
                JSON_OBJECT(
                    'order_id', o.`id`,
                    'status', o.`status`,
                    'created_at', o.`created_at`
                )
            ),
            ']'
        )
    ) AS `client_full_data`
FROM `Users` AS u
JOIN `Orders` AS o ON u.`id` = o.`user_id`
WHERE u.`id` = 1
GROUP BY u.`id`, u.`name`, u.`email`;