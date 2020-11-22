IF OBJECT_ID('GetStudentTimetable', 'P') IS NOT NULL
    DROP PROC GetStudentTimetable;

GO

CREATE PROCEDURE GetStudentTimetable @id_student INT
AS 
BEGIN
    SELECT Classes.name, Classes.type, Classes_Groups.start_time_date FROM Students

    JOIN Groups_Students ON Students.id_student = Groups_Students.id_student
    JOIN Groups ON Groups_Students.id_group = Groups.id_group

    JOIN Classes_Groups ON Classes_Groups.id_group = Groups.id_group
    JOIN Classes ON Classes.id_class = Classes_Groups.id_class

    WHERE Students.id_student = @id_student AND Classes_Groups.start_time_date BETWEEN DATEADD(DAY,-7,GETDATE()) and GETDATE()
    ORDER BY Classes_Groups.start_time_date
END;
GO

IF OBJECT_ID('GetOperatorTimetable', 'P') IS NOT NULL
    DROP PROC GetOperatorTimetable;

GO

CREATE PROCEDURE GetOperatorTimetable @id_operator INT
AS 
BEGIN
    SELECT Classes.name, Classes.type, Classes_Groups.start_time_date FROM Operators

    JOIN Classes_Operators ON Operators.id_operator = Classes_Operators.id_operator
    JOIN Classes ON Classes.id_class = Classes_Operators.id_class

    JOIN Classes_Groups ON Classes_Groups.id_class = Classes.id_class

    WHERE Operators.id_operator = @id_operator AND Classes_Groups.start_time_date BETWEEN DATEADD(DAY,-7,GETDATE()) and GETDATE()
    ORDER BY Classes_Groups.start_time_date
END;
GO

IF OBJECT_ID('GetStudentsDeadlines', 'P') IS NOT NULL
    DROP PROC GetStudentsDeadlines;

GO

CREATE PROCEDURE GetStudentsDeadlines @id_student INT
AS 
BEGIN
    SELECT Deadlines.name, Deadlines.time_date FROM Deadlines

    JOIN Groups_Deadlines ON Deadlines.id_deadline = Groups_Deadlines.id_deadline
    JOIN Groups ON Groups.id_group = Groups_Deadlines.id_group

    JOIN Groups_Students ON Groups_Students.id_group = Groups.id_group
    JOIN Students ON Students.id_student = Groups_Students.id_student

    WHERE Students.id_student = @id_student AND Deadlines.time_date > GETDATE()
    ORDER BY Deadlines.time_date
END;
GO

CREATE TABLE Operators_History(
    id_log INT IDENTITY PRIMARY KEY,
    id_operator INT,
    FOREIGN KEY (id_operator) REFERENCES Operators(id_operator),
    creation_date DATETIME NOT NULL,
)
GO

CREATE TRIGGER Operators_INSERT ON Operators
AFTER INSERT
AS
BEGIN
    INSERT INTO Operators_History(id_operator, creation_date)
    SELECT id_operator, GETDATE()
    FROM INSERTED
END;
