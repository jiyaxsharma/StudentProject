
-- STUDENT PERFORMANCE DATABASE

CREATE DATABASE StudentDB;
GO

USE StudentDB;
GO

-- Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    city VARCHAR(50)
);

-- Create Marks Table
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id)
    REFERENCES Students(student_id)
);

-- Insert Student Data
INSERT INTO Students VALUES
(1, 'Aarav', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Chandigarh'),
(4, 'Sneha', 'Pune'),
(5, 'Arjun', 'Delhi');

-- Insert Marks
INSERT INTO Marks VALUES
(101, 1, 'SQL', 85),
(102, 1, 'Python', 90),
(103, 2, 'SQL', 75),
(104, 2, 'Python', 80),
(105, 3, 'SQL', 45),
(106, 3, 'Python', 50),
(107, 4, 'SQL', 95),
(108, 4, 'Python', 92),
(109, 5, 'SQL', 60),
(110, 5, 'Python', 65);

-- Display Student Records
SELECT * FROM Students;

-- Display Marks
SELECT * FROM Marks;

-- Student Performance Report
SELECT
    S.student_id,
    S.student_name,
    S.city,
    AVG(M.marks) AS average_marks,
    CASE
        WHEN AVG(M.marks) >= 80 THEN 'Excellent'
        WHEN AVG(M.marks) >= 60 THEN 'Good'
        WHEN AVG(M.marks) >= 40 THEN 'Average'
        ELSE 'Fail'
    END AS performance
FROM Students S
JOIN Marks M
ON S.student_id = M.student_id
GROUP BY
    S.student_id,
    S.student_name,
    S.city;

-- Subject-wise Average
SELECT
    subject,
    AVG(marks) AS average_marks
FROM Marks
GROUP BY subject;

-- Highest Scoring Student
SELECT TOP 1
    S.student_name,
    AVG(M.marks) AS average_marks
FROM Students S
JOIN Marks M
ON S.student_id = M.student_id
GROUP BY S.student_name
ORDER BY average_marks DESC;

-- Create Final Dashboard View
-- Create Final Dashboard View
GO

CREATE OR ALTER VIEW StudentPerformance AS
SELECT
    S.student_id,
    S.student_name,
    S.city,
    AVG(M.marks) AS average_marks,

    CASE
        WHEN AVG(M.marks) >= 80 THEN 'Excellent'
        WHEN AVG(M.marks) >= 60 THEN 'Good'
        WHEN AVG(M.marks) >= 40 THEN 'Average'
        ELSE 'Fail'
    END AS performance

FROM Students S

INNER JOIN Marks M
    ON S.student_id = M.student_id

GROUP BY
    S.student_id,
    S.student_name,
    S.city;

GO

-- Display Final Dashboard Data
SELECT * FROM StudentPerformance;