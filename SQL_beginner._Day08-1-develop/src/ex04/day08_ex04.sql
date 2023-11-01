-- Сессиия 1
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Сессиия 2
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Сессиия 1
BEGIN;

-- Сессиия 2
BEGIN;

-- Сессиия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессиия 2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;

-- Сессиия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;

-- Сессиия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Сессиия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';