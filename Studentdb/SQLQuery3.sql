USE StudentDB;
GO

-- Add 5 more students
INSERT INTO Students (student_id, student_name, city)
VALUES
(6, 'Ananya', 'Chandigarh'),
(7, 'Rohan', 'Delhi'),
(8, 'Ishita', 'Mumbai'),
(9, 'Kabir', 'Pune'),
(10, 'Meera', 'Chandigarh');

INSERT INTO Marks (mark_id, student_id, subject, marks)
VALUES
(111, 1, 'Excel', 88),
(112, 2, 'Excel', 82),
(113, 3, 'Excel', 55),
(114, 4, 'Excel', 96),
(115, 5, 'Excel', 70);

INSERT INTO Marks (mark_id, student_id, subject, marks)
VALUES
-- Ananya
(116, 6, 'SQL', 92),
(117, 6, 'Python', 89),
(118, 6, 'Excel', 94),

-- Rohan
(119, 7, 'SQL', 68),
(120, 7, 'Python', 72),
(121, 7, 'Excel', 75),

-- Ishita
(122, 8, 'SQL', 85),
(123, 8, 'Python', 91),
(124, 8, 'Excel', 87),

-- Kabir
(125, 9, 'SQL', 38),
(126, 9, 'Python', 42),
(127, 9, 'Excel', 35),

-- Meera
(128, 10, 'SQL', 78),
(129, 10, 'Python', 84),
(130, 10, 'Excel', 81);

SELECT * FROM Students;

SELECT * FROM Marks;

SELECT * FROM StudentPerformance;