-- Show all students ordered by last name in ascendent way.
SELECT * FROM Alumni ORDER BY lastName ASC
-- Write a query to list all the students living in the Whitman dorm.
SELECT * FROM Student WHERE dormName = "Whitman";
-- Write a query to list the number of students assigned to each faculty advisor.
SELECT
S.StudentId,
A.AdvisorId
FROM Advisor_Student_Date ASD
INNER JOIN Student S
ON ASD.StudentId = S.StudentId
INNER JOIN Advisor A
ON ASD.AdvisorId = A.AdvisorId

-- Write a query to list first name, last name, and email, and company name of the alumni working as a mentor in the university.
SELECT
A.firstName,
A.lastName,
A.AlumniEmail,
M.mentorEmail, 
C.companyName
FROM Mentor M
INNER JOIN Alumni A
ON M.AlumniEmail = A.AlumniEmail
INNER JOIN Company C
ON M.companyPhone = C.companyPhone
