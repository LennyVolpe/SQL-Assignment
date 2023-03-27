/*Print out all the student first names and last names*/
select first_name, last_name
from university.student;

/*Print out the IDs of all the tenured instructors*/
select instructor_id, first_name
from university.instructor
where tenured = 1; 

/*Print out the student first and last names along with their advisor's first and last names.
 Make sure to alias descriptive column names. Leave out any students without advisors and any 
 advisors without students*/
SELECT s.first_name AS student_first, s.last_name AS student_last, 
       i.first_name AS advisor_first, i.last_name AS advisor_last
FROM student s
INNER JOIN instructor i ON s.advisor_id = i.instructor_id;

/*Print out the ID, first name, and last name of all instructors who do not have any advisees
(HINT: Lookup the different join types in MySQL and use "IS NULL" instead of "= NULL")*/
SELECT instructor_id, instructor.first_name, instructor.last_name
FROM instructor
LEFT JOIN student ON instructor.instructor_id = student.advisor_id
WHERE student.advisor_id IS NULL;

/*Print out the first and last name of all the instructors along with the total number of credit hours they teach*/
SELECT instructor.first_name, instructor.last_name, SUM(course.num_credits) AS total_credits
FROM instructor
JOIN course ON instructor.instructor_id = course.instructor_id
GROUP BY instructor.instructor_id;


/*Print out the course code and course name of all 3000 level courses (HINT: Lookup the SQL LIKE operator)*/
SELECT course_code, course_name
FROM course 
WHERE course_code LIKE '____ 3%';

/*Print out the course schedule of the student with an ID of 1 by printing off the course code, instructor first name,
 instructor last name, and number of credit hours for each course in which student 1 is enrolled*/
 SELECT course.course_code, instructor.first_name, instructor.last_name, course.num_credits
 FROM student_schedule
 JOIN course ON student_schedule.course_id = course.course_id
 JOIN instructor ON course.instructor_id = instructor.instructor_id
 WHERE student_schedule.student_id=1;
 
 







