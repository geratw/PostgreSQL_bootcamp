-- выполнил команду SHOW TRANSACTION ISOLATION LEVEL, убедился что я нахожусь на уровне изоляции по умолчанию в своей базе данных. Результат «read commit»;

-- Сессиия 1
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессиия 2
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессиия 1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- Сессиия 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- ждёт

-- Сессиия 1
COMMIT;
-- сессиия 2 обновилась

-- Сессиия 2
COMMIT;
-- Сессиия 1 получил значение 3.6


-- Сессиия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессиия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
