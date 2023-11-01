CREATE SEQUENCE seq_person_discounts  START with  1 increment by 1;
select setval('seq_person_discounts', (select max(id) from person_discounts));
ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');



