INSERT INTO person_visits
VALUES ((select MAX(id)+1 from person_visits), (select id from person where name='Denis') ,(select id from pizzeria where name = 'Dominos'),'2022-02-24'),
       ((select MAX(id)+2 from person_visits), (select id from person where name='Irina') ,(select id from pizzeria where name = 'Dominos'),'2022-02-24');
