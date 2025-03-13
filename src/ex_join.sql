use db_university;

#Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT s.*
FROM students s
JOIN degrees d on d.id = s.degree_id
WHERE d.name like "Corso di Laurea in Economia";

#Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT *
FROM degrees deg
JOIN departments dep on deg.department_id = dep.id
WHERE dep.id = 7
AND deg.level like "magistrale";


#Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT *
FROM courses c
JOIN course_teacher ct on ct.course_id = c.id
JOIN teachers t on ct.teacher_id = t.id
WHERE (t.name like "Fulvio"
AND t.surname like "Amato");

#Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
#sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT distinct*
FROM students s
JOIN degrees deg on deg.id = s.degree_id
JOIN departments dep on dep.id = deg.department_id
ORDER BY s.name, s.surname;

#Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT *
FROM courses c
JOIN degrees deg on deg.id = c.degree_id
JOIN course_teacher ct on ct.course_id = c.id
JOIN teachers t on ct.teacher_id = t.id;


#Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica
 
SELECT distinct t.*, dep.name
FROM teachers t
JOIN course_teacher ct on ct.teacher_id = t.id
JOIN courses c on c.id = ct.course_id
JOIN degrees deg on deg.id = c.degree_id
JOIN departments dep on dep.id = deg.department_id
WHERE dep.name like "Dipartimento di Matematica";

#BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente,
#filtrare i tentativi con voto minimo 18

SELECT *,
s.name as "Nome Studente",
s.surname as "Cognome Studente",
s.id as "studente",
count(e.id) as "tentativi esame"
FROM students s
JOIN exam_student es on es.student_id = s.id
JOIN exams e on es.exam_id = e.id
GROUP BY s.id, e.id;

