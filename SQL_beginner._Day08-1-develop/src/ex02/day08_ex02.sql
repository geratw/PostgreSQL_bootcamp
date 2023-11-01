-- Сессиия 1
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Сессиия 2
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

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

-- Сессиия 1
COMMIT;

-- Сессиия 2
COMMIT;

-- Сессиия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессиия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';