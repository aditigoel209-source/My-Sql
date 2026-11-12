DROP DATABASE IF EXISTS training_functions;
DROP DATABASE IF EXISTS training_functions;
CREATE DATABASE training_functions;
USE training_functions;
CREATE TABLE CourseEnrollments (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(40),
LastName VARCHAR(40),
CourseName VARCHAR(40),
Fee DECIMAL(10,2),
EnrollmentDate DATE,
CompletionDate DATE
);
INSERT INTO CourseEnrollments
(StudentID, FirstName, LastName, CourseName, Fee, EnrollmentDate, CompletionDate)
VALUES
(101, 'aman', 'Sharma', 'Python', 12500.75, '2026-01-05', '2026-03-20'),
(102, 'priya', 'Verma', 'MySQL', 9800.40, '2026-01-12', '2026-02-28'),
(103, 'rahul', 'Singh', 'Python', 15750.90, '2026-02-01', '2026-04-15'),
(104, 'neha', 'Gupta', 'Power BI', 11200.25, '2026-02-10', '2026-05-05'),
(105, 'ishita', 'Kapoor', 'MySQL', 8900.60, '2026-03-03', '2026-04-22'),
(106, 'arjun', 'Mehta', 'Python', 13650.15, '2026-03-15', '2026-06-10'),
(107, 'simran', 'Joshi', 'Power BI', 10400.95, '2026-04-01', '2026-06-30'),
(108, 'vikas', 'Rao', 'MySQL', 7600.50, '2026-04-18', '2026-05-29'),
(109, 'kiran', 'Malik', 'Python', 14999.99, '2026-05-02', '2026-07-25'),
(110, 'rohan', 'Sethi', 'Power BI', 11950.35, '2026-05-20', '2026-08-14');

SELECT * FROM CourseEnrollments;

Select UPPER(CONCAT(Firstname,' ',lastname)) AS FullName
From CourseEnrollments;
Select CONCAT(UPPER(SUBSTRING(Firstname,1,1)),
Substring(Firstname,2),' ',Lastname) AS Fullname_sub
From CourseEnrollments;
Select CONCAT(UPPER(LEFT(CourseName,3)),'-',StudentID) AS StudentCode
From CourseEnrollments;
Select Firstname,
      REVERSE(FirstName) AS Firstnamereversed,
      Char_length(Reverse(firstname)) AS CHAR_LENGTH
       From CourseEnrollments;
Select firstname,
    LOCATE('a',firstname)
from CourseEnrollments;
Select Firstname,
      UPPER(REPLACE(Firstname,'a','o')) AS Firstnamereplaced
From CourseEnrollments;
Select LPAD(Firstname,'12','0')
From CourseEnrollments;
Select CONCAT(RIGHT(Coursename,2),'-',LEFT(Firstname,2)) AS Courselabel
From CourseEnrollments;
SELECT CONCAT(UPPER(SUBSTRING(FirstName, 1, 3)), LOWER(RIGHT(LastName, 2))) AS StudentCode
FROM CourseEnrollments;
SELECT Fee, ROUND(Fee, 1) AS RoundedFee_OneDecimal, ROUND(Fee, 0) AS RoundedFee_WholeNumber
FROM CourseEnrollments;
SELECT Fee, CEIL(Fee) AS RoundedUp, FLOOR(Fee) AS RoundedDown
FROM CourseEnrollments;
SELECT Fee, MOD(Fee, 500) AS FeeRemainder
FROM CourseEnrollments;
SELECT Fee, ABS(Fee - 10000) AS AbsoluteDifference
FROM CourseEnrollments;
SELECT Fee, ROUND(Fee * 1.18, 2) AS UpdatedFee
FROM CourseEnrollments;
SELECT Fee, FORMAT(Fee, 2) AS FormattedFee
FROM CourseEnrollments;
SELECT YEAR(EnrollmentDate) AS EnrollmentYear,
MONTHNAME(EnrollmentDate) AS EnrollmentMonth,
DAYNAME(EnrollmentDate) AS EnrollmentDay
FROM CourseEnrollments;
SELECT
DATE_FORMAT(EnrollmentDate, '%d/%m/%Y') AS EnrollmentDate,
DATE_FORMAT(CompletionDate, '%M %d, %Y') AS CompletionDate
FROM CourseEnrollments;
SELECT EnrollmentDate, CompletionDate,
TIMESTAMPDIFF(DAY, EnrollmentDate, CompletionDate) AS TotalDays
FROM CourseEnrollments;
SELECT EnrollmentDate,
DATE_ADD(DATE_ADD(EnrollmentDate, INTERVAL 1 MONTH), INTERVAL 10 DAY) AS NewDate
FROM CourseEnrollments;
SELECT CompletionDate,
DATE_ADD(CompletionDate, INTERVAL -7 DAY) AS PreviousDate
FROM CourseEnrollments;
SELECT EnrollmentDate, CompletionDate,
TIMESTAMPDIFF(MONTH, EnrollmentDate, CompletionDate) AS TotalMonths
FROM CourseEnrollments;
SELECT EnrollmentDate,
DATE_ADD(DATE_ADD(DATE_ADD(EnrollmentDate, INTERVAL 1 YEAR), INTERVAL 2 MONTH), INTERVAL 5 DAY) AS ShiftedDate
FROM CourseEnrollments;
SELECT
EnrollmentDate, DAYNAME(EnrollmentDate) AS EnrollmentWeekday,
CompletionDate, DAYNAME(CompletionDate) AS CompletionWeekday
FROM CourseEnrollments;
SELECT EnrollmentDate,
TIMESTAMPDIFF(DAY, EnrollmentDate, CURDATE()) AS DaysUntilToday
FROM CourseEnrollments;
SELECT
CompletionDate,
DATE_FORMAT(DATE_ADD(CompletionDate, INTERVAL 15 DAY), '%d/%m/%Y') AS NewCompletionDate
FROM CourseEnrollments;
