-- 4
SELECT
    c1.room_id,
    room_number,
    COUNT(1) AS num_of_classes
FROM
    Classes c1
JOIN
    -- link CLASSES to ROOMS
    Rooms r1 ON c1.room_id = r1.room_id
JOIN
    -- link CLASSES to AVAILABLE_SUBJECTS (to bridge CLASSES and SEMESTERS)
    Available_Subjects as1 ON c1.available_subject_id = as1.available_subject_id
JOIN
    -- link AVAILABLE_SUBJECTS to SEMESTERS (for WHERE)
    Semesters sem1 ON as1.semester_id = sem1.semester_id
JOIN
    -- link SEMESTERS to SCHOOL_YEARS (for WHERE)
    School_years sy1 ON sem1.school_year_id = sy1.school_year_id
WHERE
    year_start = 2019 AND year_end = 2020 AND semester = 2
GROUP BY
    c1.room_id
ORDER BY room_number;
