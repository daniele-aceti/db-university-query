USE db_university;

SELECT count(*) as 'studenti nati nel 1990'
FROM students
WHERE YEAR(date_of_birth) = 1990;

SELECT count(*) as 'Corsi > 10 cfu'
FROM courses
WHERE cfu > 10;

SELECT name , year(date_of_birth)
FROM STUDENTS
WHERE  YEAR(date_of_birth) > 1995
ORDER BY YEAR(date_of_birth) desc;


SELECT count(*),year, period
FROM courses
WHERE year = 1
AND period = 'I semestre';

SELECT count(*),date
FROM exams
WHERE date = '2020-06-20'
AND hour > '14:00:00';

SELECT count(*) as 'Corsi Magistrale'
FROM degrees
WHERE level LIKE 'magistrale';

SELECT count(*) as 'Dipartimenti università'
FROM departments;

SELECT count(*) as 'Insegnati con un numero di telefono'
FROM teachers
WHERE phone;

SELECT count(*), year(date_of_birth)
FROM students
GROUP BY year(date_of_birth);


SELECT count(*),office_address
FROM teachers
GROUP BY office_address;

SELECT avg(vote) as 'media voti', exam_id as 'Appello Esame'
FROM exam_student
GROUP BY exam_id;

SELECT count(*) as 'Corsi di laurea', department_id
FROM degrees
GROUP BY department_id;
