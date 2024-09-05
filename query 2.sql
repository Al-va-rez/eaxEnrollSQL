-- 2
SELECT
	-- sort by room number
	ROW_NUMBER() OVER (ORDER BY available_subject_name) AS row_num,
    -- from AVAILABLE_SUBJECTS
    available_subject_name,
    -- from CLASSES
    day,
    time_start,
    time_end,
    -- from rooms
    room_number,
    -- from FACULTY
	f1.faculty_id,
	first_name,
    last_name
FROM
	Classes c1
JOIN
	-- Get subject name
    Available_subjects as1 ON c1.available_subject_id = as1.available_subject_id
JOIN
	-- Get room number
    Rooms r1 ON c1.room_id = r1.room_id
JOIN
	-- Get assigned teacher
    Faculty f1 ON c1.faculty_id = f1.faculty_id
JOIN
	-- Get semester and school year
    Semesters s1 ON as1.semester_id = s1.semester_id
JOIN
    -- Get start and end of school year
    School_years sy1 ON s1.school_year_id = sy1.school_year_id
WHERE
	semester = 1 AND year_start = 2019 AND year_end = 2020;