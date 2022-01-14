--Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(id), year(enrolment_date) FROM students GROUP BY YEAR(enrolment_date)

--Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(id), office_address FROM teachers GROUP BY office_address

--Calcolare la media dei voti di ogni appello d'esame

SELECT AVG(vote), exam_id FROM exam_student GROUP BY exam_id

--Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(id), department_id FROM degrees GROUP BY department_id

--Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT * FROM `students` JOIN degrees ON degrees.id = students.degree_id WHERE degrees.name = 'Corso di Laurea in Economia'

--Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT * FROM departments JOIN degrees ON departments.id = degrees.department_id WHERE departments.name = 'Dipartimento di Neuroscienze' 

--Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT * FROM teachers JOIN course_teacher ON teachers.id = course_teacher.teacher_id JOIN courses ON course_teacher.course_id = courses.id WHERE teachers.name = 'Fulvio' AND teachers.surname = 'Amato'

--Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT students.id, students.name, students.surname, degrees.name, departments.name FROM `students` JOIN degrees ON students.degree_id = degrees.id JOIN departments ON degrees.department_id = departments.id ORDER BY students.surname, students.name