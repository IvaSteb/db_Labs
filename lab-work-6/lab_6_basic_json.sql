-- Форматування даних користувача id = 1 у валідний JSON-об'єкт
SELECT 
    JSON_OBJECT(
        'user_id', `id`,
        'full_name', `name`,
        'contact_email', `email`
    ) AS `user_json_data`
FROM `users`
WHERE `id` = 1;