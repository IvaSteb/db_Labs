-- 1. Створюємо індекс
-- idx_users_name - це просто ім'я для нашого індексу
-- ON `Users` (`name`) - вказуємо, яку таблицю та колонку індексувати
CREATE INDEX `idx_users_name` ON `Users` (`name`);