-- 3
SELECT
	ROW_NUMBER() OVER (ORDER BY grade_id) as row_num,
	-- from STUDENTS
	stu1.student_id,
	first_name,
	last_name,
	-- from AVAILABLE_SUBJECTS
	available_subject_name,
	-- from GRADES
	grade_id,
	grade AS Grades,
	-- from SEMESTER and SCHOOL_YEARS
	year_start,
	year_end,
	semester
FROM
	Grades g1
JOIN
	-- link STUDENTS to GRADES
	Students stu1 ON g1.student_id = stu1.student_id
JOIN
	-- link SEMESTER to GRADES (for WHERE)
	Semesters sem1 ON g1.school_year_id = sem1.school_year_id
JOIN
	-- link SCHOOL_YEARS to SEMESTER (for WHERE)
	School_years sy1 ON sem1.school_year_id = sy1.school_year_id
JOIN
	-- link GRADES to CLASSES (acts as bridge to connect to AVAILABLE_SUBJECTS)
	Classes c1 ON g1.class_id = c1.class_id
JOIN
	-- link CLASSES to AVAILABLE_SUBJECTS (to get subject names)
	Available_subjects as1 ON c1.available_subject_id = as1.available_subject_id
WHERE
	stu1.student_id = 2 AND year_start = 2019 AND year_end = 2020 AND semester = 1;