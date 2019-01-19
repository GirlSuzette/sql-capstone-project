CREATE TABLE Student(
    StudentId INT NOT NULL PRIMARY KEY,
    email VARCHAR(150) NOT NULL,
    UNIQUE KEY `email` (`email`),
    lastName VARCHAR(100) NOT NULL,
    firstName VARCHAR(100) NOT NULL,
    dormPhone VARCHAR(100),
    dormName VARCHAR(100),
    dormRoom INT 
);

INSERT INTO Student  (StudentId, email, firstName, lastName, dormPhone, dormName, dormRoom) VALUES (2001, "John.Bob@students.hu.edu", "John", "Bob", "516-555-5655", "Whitman", 1);
INSERT INTO Student  (StudentId, email, firstName, lastName, dormPhone, dormName, dormRoom) VALUES (2002, "Ryan.King@students.hu.edu", "Ryan", "King", "516-555-5655", "Whitman",1);
INSERT INTO Student  (StudentId, email, firstName, lastName, dormPhone, dormName, dormRoom) VALUES (2003, "Michael.Shawn@students.hu.edu", "Michael", "Shawn",  "516-555-5655", "Whitman",1);
INSERT INTO Student  (StudentId, email, firstName, lastName, dormPhone, dormName, dormRoom) VALUES (2004, "Troy.Bell@students.hu.edu", "Troy", "Bell", "516-555-5655", "Whitman", 1);
INSERT INTO Student  (StudentId, email, firstName, lastName, dormPhone, dormName, dormRoom) VALUES (2005, "Nickel.Sauce@students.hu.edu", "Nickel", "Sauce", "718-525-1615", "Hale", 1);
INSERT INTO Student  (StudentId, email, firstName, lastName, dormPhone, dormName, dormRoom) VALUES (2006, "Drake.Taco@students.hu.edu", "Drake", "Taco", "516-555-5655", "Whitman", 1);

CREATE TABLE Graduation(
    StudentId INT,
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
    StudentDegree VARCHAR(200) NOT NULL PRIMARY KEY,
    dateEnrolled Date,
    dateGraduated Date
);

INSERT INTO Graduation (StudentId, StudentDegree, dateEnrolled) VALUES (2001, "B.A Arts", "2000-01-01");
INSERT INTO Graduation (StudentId, StudentDegree, dateEnrolled) VALUES (2002, "B.A Comp. Programming", "2000-01-01");
INSERT INTO Graduation (StudentId, StudentDegree, dateEnrolled) VALUES (2003, "B.A Media", "2000-01-01");


CREATE TABLE Advisor(
    AdvisorId INT NOT NULL PRIMARY KEY,
    email  VARCHAR(150) NOT NULL,
    UNIQUE KEY `email` (`email`),
    lastName VARCHAR(100) NOT NULL,
    firstName VARCHAR(100) NOT NULL    
);

INSERT INTO Advisor  (AdvisorId, email, firstName, lastName) VALUES (2001, "John.Doe@hu.edu", "John", "Doe");
INSERT INTO Advisor  (AdvisorId, email, firstName, lastName) VALUES (2002, "Alice.Wonderland@hu.edu", "Alice", "Wonderland");
INSERT INTO Advisor  (AdvisorId, email, firstName, lastName) VALUES (2003, "Bob.Dylan@hu.edu", "Bob", "Dylan");


CREATE TABLE Advisor_Student_Date (
    AdvisorId INT,
    StudentId INT,
    StarDate  Date,
    endDate Date,
    FOREIGN KEY (AdvisorId) REFERENCES Advisor(AdvisorId),
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId)
);

INSERT INTO Advisor_Student_Date (AdvisorId, StudentId, StarDate, endDate) VALUES (2001, 2002, "1996-01-01", "1998-01-01");
INSERT INTO Advisor_Student_Date (AdvisorId, StudentId, StarDate) VALUES (2002, 2001, "2000-01-01");
INSERT INTO Advisor_Student_Date (AdvisorId, StudentId, StarDate) VALUES (2003, 2003, "2000-01-01");


CREATE TABLE Department(
    AdvisorId INT,
    DepartmentName VARCHAR(200),
    officeBuildingName VARCHAR(255) NOT NULL,
    officeRoom INT,
    officePhone VARCHAR(200),
    FOREIGN KEY (AdvisorId) REFERENCES Advisor(AdvisorId)
);

INSERT INTO Department (AdvisorId, DepartmentName, officeBuildingName, officeRoom, officePhone) VALUES (2001, "Art", "Hale", 1, "631-444-5551");
INSERT INTO Department (AdvisorId, DepartmentName, officeBuildingName, officeRoom, officePhone) VALUES (2002, "Computer Systems", "Hale", 1, "631-444-3552");
INSERT INTO Department (AdvisorId, DepartmentName, officeBuildingName, officeRoom, officePhone) VALUES (2003, "Art", "Media", 1, "631-144-1533");


CREATE TABLE Alumni(
    AlumniEmail VARCHAR(200) NOT NULL PRIMARY KEY,
    UNIQUE KEY `AlumniEmail` (`AlumniEmail`),
    lastName VARCHAR(100) NOT NULL,
    firstName VARCHAR(100) NOT NULL,
    formerStudentID INT
);

INSERT INTO Alumni  (AlumniEmail, firstName, lastName, formerStudentID) VALUES ("Antony.Jaghab@somewhere.com", "Anthony", "Jaghab", 1001);
INSERT INTO Alumni  (AlumniEmail, firstName, lastName, formerStudentID) VALUES ("Jupraj.Singh@somewhere.com", "Jupraj", "Singh", 1002);
INSERT INTO Alumni  (AlumniEmail, firstName, lastName, formerStudentID) VALUES ("Andre.King@somewhere.com", "Andre", "King", 1003);

CREATE TABLE Alumni_Home(
    AlumniEmail VARCHAR(200),
    homeAddress VARCHAR(200),
    homeCity VARCHAR(200),
    homeState VARCHAR(200),
    homeZIP INT(5),
    homePhone VARCHAR(100),
    FOREIGN KEY (AlumniEmail) REFERENCES Alumni(AlumniEmail)
);

INSERT INTO Alumni_Home (AlumniEmail, homeAddress, homeCity, homeState, homeZIP, homePhone) VALUES ("Anthony.Jaghab@somewhere.com", "414 Hunt Place", "West Hempstead", "NY", 11552, "516-555-5551");
INSERT INTO Alumni_Home (AlumniEmail, homeAddress, homeCity, homeState, homeZIP, homePhone) VALUES ("Jupraj.Singh@somewhere.com", "201 Valley Place", "West Hempstead", "NY", 11552, "516-555-5552");
INSERT INTO Alumni_Home (AlumniEmail, homeAddress, homeCity, homeState, homeZIP, homePhone) VALUES ("Andre.King@somewhere.com", "204 Strong Place", "West Hempstead", "NY", 11552, "516-555-5553");

CREATE TABLE Company(
    CompanyPhone VARCHAR(50) NOT NULL PRIMARY KEY,
    companyName VARCHAR(200),
    companyAddress VARCHAR(200),
    companyCity VARCHAR(200),
    companyState VARCHAR(200),
    campanyZIP INT(5) 
);

INSERT INTO Company  (CompanyPhone, companyName, companyAddress, companyCity, companyState, campanyZIP) VALUES ("516-111-1112", "Richard Allen", "400 Forest Ave", "West Hempstead", "NY", 11552);
INSERT INTO Company  (CompanyPhone, companyName, companyAddress, companyCity, companyState, campanyZIP) VALUES ("516-111-1113", "Coca Cola", "321 Hamburger Ave", "West Hempstead", "NY", 11552);
INSERT INTO Company  (CompanyPhone, companyName, companyAddress, companyCity, companyState, campanyZIP) VALUES ("516-111-1114", "Pepsi", "21 West Valley Ave", "West Hempstead", "NY", 11552);

CREATE TABLE Mentor(
    mentorEmail VARCHAR(200) NOT NULL PRIMARY KEY,
    lastName VARCHAR (200),
    firstName VARCHAR(200),
    AlumniEmail VARCHAR(200),
    CompanyPhone VARCHAR(50),
    FOREIGN KEY (AlumniEmail) REFERENCES Alumni(AlumniEmail),
    FOREIGN KEY (CompanyPhone) REFERENCES Company(CompanyPhone)
);

INSERT INTO Mentor  (mentorEmail, firstName, lastName, AlumniEmail, CompanyPhone) VALUES ("Andre.King@companyname.com", "Andre", "King", "Andre.King@somewhere.com", "516-111-1112");
INSERT INTO Mentor (mentorEmail, firstName, lastName, CompanyPhone) VALUES ("Michael.Junior@companyname.com", "Michel", "Junior", "516-111-1114");
INSERT INTO Mentor  (mentorEmail, firstName, lastName, CompanyPhone) VALUES ("Connor.Junior@companyname.com", "Connor", "Junior", "516-111-1113");

CREATE TABLE Mentor_Student_Date(
    mentorEmail VARCHAR(200),
    StudentId INT,
    StarDate Date,
    endDate Date,
    FOREIGN KEY (mentorEmail) REFERENCES Mentor(mentorEmail),
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId)
);

INSERT INTO Mentor_Student_Date (mentorEmail, StudentId, StarDate) VALUES ("Andre.King@companyname.com", 2001, "2000-01-01");
INSERT INTO Mentor_Student_Date (mentorEmail, StudentId, StarDate) VALUES ("Andre.King@companyname.com", 2002, "2001-01-01");
INSERT INTO Mentor_Student_Date (mentorEmail, StudentId, StarDate) VALUES ("Andre.King@companyname.com", 2003, "2002-01-01");


CREATE TABLE Advisor_Mentor_Date(
    mentorEmail VARCHAR(200),
    AdvisorId INT,
    StarDate Date,
    endDate Date,
    FOREIGN KEY (mentorEmail) REFERENCES Mentor(mentorEmail),
    FOREIGN KEY (AdvisorId) REFERENCES Advisor(AdvisorId)
);

INSERT INTO Advisor_Mentor_Date (AdvisorId, mentorEmail, StarDate) VALUES (2001, "Andre.King@companyname.com", "1996-01-01");
INSERT INTO Advisor_Mentor_Date (AdvisorId, mentorEmail,  StarDate) VALUES (2002, "Andre.King@companyname.com", "2000-01-01");
INSERT INTO Advisor_Mentor_Date (AdvisorId, mentorEmail,  StarDate) VALUES (2003, "Andre.King@companyname.com", "2000-01-01");
