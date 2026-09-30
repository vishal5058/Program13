CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

INSERT INTO Department VALUES
(10, 'Computer Science'),
(20, 'Mathematics');


-- Faculty table
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

INSERT INTO Faculty VALUES
(1, 'Dr. Ravi', 10),
(2, 'Dr. Meena', 20);


-- Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL
);

INSERT INTO Student VALUES
(1001, 'Arun'),
(1002, 'Priya'),
(1003, 'Kumar');


-- Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    FacultyID INT,
    FOREIGN KEY (FacultyID)
        REFERENCES Faculty(FacultyID)
);

INSERT INTO Course VALUES
(201, 'Database Systems', 1),
(202, 'Data Structures', 1),
(203, 'Mathematics', 2);


-- StudentCourse table
CREATE TABLE StudentCourse (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);

INSERT INTO StudentCourse VALUES
(1001, 201),
(1001, 202),
(1002, 203),
(1003, 201);


-- Display normalized data using JOIN
SELECT
    Student.StudentID,
    Student.StudentName,
    Course.CourseName,
    Faculty.FacultyName,
    Department.DepartmentName
FROM Student
INNER JOIN StudentCourse
    ON Student.StudentID = StudentCourse.StudentID
INNER JOIN Course
    ON StudentCourse.CourseID = Course.CourseID
INNER JOIN Faculty
    ON Course.FacultyID = Faculty.FacultyID
INNER JOIN Department
    ON Faculty.DepartmentID = Department.DepartmentID;
