-- Сессиия 1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
select * from pizzeria where name  = 'Pizza Hut';

-- Сессиия 2
select * from pizzeria where name  = 'Pizza Hut';

-- Сессиия 1
COMMIT;

-- Сессиия 2
select * from pizzeria where name  = 'Pizza Hut';