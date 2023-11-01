-- Сессиия 1
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Сессиия 2
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Сессиия 1
BEGIN;

-- Сессиия 2
BEGIN;

-- Сессиия 1
SELECT SUM(rating) FROM pizzeria;

-- Сессиия 2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
COMMIT;

-- Сессиия 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;

-- Сессиия 1
SELECT SUM(rating) FROM pizzeria;

-- Сессиия 2
SELECT SUM(rating) FROM pizzeria;
