create INDEX idx_person_name on person (UPPER (name));

SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
SELECT *
FROM person p
WHERE UPPER(p.name) = 'DENIS';