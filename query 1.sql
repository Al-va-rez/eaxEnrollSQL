-- 1
SELECT
    -- sort by faculty
    ROW_NUMBER() OVER (ORDER BY f1.faculty_id) AS row_num,
    -- from FACULTY
    f1.faculty_id,
    first_name,
    last_name,
    -- from AVAILABLE_SUBJECTS
    available_subject_name AS Subject_teaching,
    -- from CLASSES
    c1.class_id,
    time_start,
    time_end,
    day,
    -- from SEMESTERS
    year_start AS school_year_start,
    year_end AS school_year_end,
    semester
FROM
    Classes c1
JOIN
    -- Get assigned teacher
    Faculty f1 ON c1.faculty_id = f1.faculty_id
JOIN
    -- Get subject name
    -- note: available_subject_id goes only up to 20; therefore, not all classes will be included
    Available_subjects as1 ON c1.available_subject_id = as1.available_subject_id
JOIN
    -- Get semester and school year
    Semesters s1 ON as1.semester_id = s1.semester_id
JOIN
    -- Get start and end of school year
    School_years sy1 ON s1.school_year_id = sy1.school_year_id;