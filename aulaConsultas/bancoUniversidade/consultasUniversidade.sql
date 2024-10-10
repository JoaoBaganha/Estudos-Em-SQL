-- Listar alunos que estão matriculados em um determinado curso em um semestre específico:
SELECT student.name, takes.course_id, takes.semester
FROM student
JOIN takes
ON student.id = takes.id
WHERE course_id = 'CS101' AND semester = 'Fall';

-- Listar todos os departamentos e contar quantos cursos cada departamento oferece:
SELECT dept_name,
COUNT(course_id) AS "number_courses"
FROM course
GROUP BY dept_name;

-- Listar os 5 cursos com mais alunos matriculados:
SELECT course_id,
COUNT(id) AS "number_students"
FROM takes
GROUP BY course_id
ORDER BY number_students DESC
LIMIT 5;

-- Listar todos os cursos oferecidos pelo departamento de Matemática, separados por vírgula:


--  Contar quantos alunos estão matriculados em cada seção de curso em um semestre específico:
SELECT sec_id, 
COUNT(id) AS "number_students"
FROM takes
WHERE semester = 'Fall'
GROUP BY sec_id;


-- Calcular a média de créditos de todos os cursos oferecidos:
SELECT
	AVG(credits)
FROM course;

-- Encontrar a menor e a maior capacidade entre todas as salas de aula:
SELECT 
	MAX(capacity),
	MIN(capacity)
FROM classroom;

-- Listar todos os cursos oferecidos no departamento de Biology no ano de 2023:

SELECT section.course_id, section.year, course.dept_name
FROM section
JOIN course
ON section.course_id = course.course_id
WHERE dept_name = 'Biology' AND year = 2023;

-- Listar todos os instrutores que não têm um departamento atribuído:
SELECT *
FROM instructor
WHERE dept_name IS NULL;

-- Listar os cursos e seus instrutores, agrupados por departamento:

-- Listar as salas de aula que estão vazias (não têm seções atribuídas) no semestre de outono de 2023:
SELECT classroom.room_number, section.room_number, section.semester
FROM classroom
LEFT JOIN section
ON classroom.room_number = section.room_number
AND semester = 'Fall' AND year = 2023
WHERE section.room_number IS NULL; 


-- Listar todos os departamentos e a data de início do semestre mais antigo em que um curso foi oferecido por cada departamento:



