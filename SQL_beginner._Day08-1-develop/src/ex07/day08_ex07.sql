-- Сессиия 1
BEGIN;

-- Сессиия 2
BEGIN;

-- Сессиия 1
UPDATE pizzeria SET rating = 2 WHERE id =1;

-- Сессиия 2
UPDATE pizzeria SET rating = 3 WHERE id =2;

-- Сессиия 1
UPDATE pizzeria SET rating = 1 WHERE id =2;

-- Сессиия 2
UPDATE pizzeria SET rating = 5 WHERE id =1;

-- Сессиия 1
COMMIT;

-- Сессиия 2
COMMIT;