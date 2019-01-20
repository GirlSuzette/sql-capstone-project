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

CREATE TABLE Graduation(
    StudentId INT,
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
    StudentDegree VARCHAR(200) NOT NULL PRIMARY KEY,
    dateEnrolled Date,
    dateGraduated Date
);


CREATE TABLE Advisor(
    AdvisorId INT NOT NULL PRIMARY KEY,
    email  VARCHAR(150) NOT NULL,
    UNIQUE KEY `email` (`email`),
    lastName VARCHAR(100) NOT NULL,
    firstName VARCHAR(100) NOT NULL    
);


CREATE TABLE Advisor_Student_Date (
    AdvisorId INT,
    StudentId INT,
    StarDate  Date,
    endDate Date,
    FOREIGN KEY (AdvisorId) REFERENCES Advisor(AdvisorId),
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId)
);


CREATE TABLE Department(
    AdvisorId INT,
    DepartmentName VARCHAR(200) PRIMARY KEY,
    officeBuildingName VARCHAR(255) NOT NULL,
    officeRoom INT,
    officePhone VARCHAR(200),
    FOREIGN KEY (AdvisorId) REFERENCES Advisor(AdvisorId)
);


CREATE TABLE Alumni(
    AlumniEmail VARCHAR(200) NOT NULL PRIMARY KEY,
    UNIQUE KEY `AlumniEmail` (`AlumniEmail`),
    lastName VARCHAR(100) NOT NULL,
    firstName VARCHAR(100) NOT NULL,
    formerStudentID INT
);


CREATE TABLE Alumni_Home(
    AlumniEmail VARCHAR(200),
    homeAddress VARCHAR(200),
    homeCity VARCHAR(200),
    homeState VARCHAR(200),
    homeZIP INT(5),
    homePhone VARCHAR(100),
    FOREIGN KEY (AlumniEmail) REFERENCES Alumni(AlumniEmail)
);


CREATE TABLE Company(
    CompanyPhone VARCHAR(50) NOT NULL PRIMARY KEY,
    companyName VARCHAR(200),
    companyAddress VARCHAR(200),
    companyCity VARCHAR(200),
    companyState VARCHAR(200),
    campanyZIP INT(5) 
);


CREATE TABLE Mentor(
    mentorEmail VARCHAR(200) NOT NULL PRIMARY KEY,
    lastName VARCHAR (200),
    firstName VARCHAR(200),
    AlumniEmail VARCHAR(200),
    CompanyPhone VARCHAR(50),
    FOREIGN KEY (AlumniEmail) REFERENCES Alumni(AlumniEmail),
    FOREIGN KEY (CompanyPhone) REFERENCES Company(CompanyPhone)
);


CREATE TABLE Mentor_Student_Date(
    mentorEmail VARCHAR(200),
    StudentId INT,
    StarDate Date,
    endDate Date,
    FOREIGN KEY (mentorEmail) REFERENCES Mentor(mentorEmail),
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId)
);



CREATE TABLE Advisor_Mentor_Date(
    mentorEmail VARCHAR(200),
    AdvisorId INT,
    StarDate Date,
    endDate Date,
    FOREIGN KEY (mentorEmail) REFERENCES Mentor(mentorEmail),
    FOREIGN KEY (AdvisorId) REFERENCES Advisor(AdvisorId)
);
