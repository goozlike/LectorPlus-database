CREATE DATABASE PHARMNETWORK;

CREATE TABLE class (
    id_class INT PRIMARY KEY,
    type VARCHAR(30),
    link_to_folder_with_materials VARCHAR(30),
    link_to_record VARCHAR(30)
);

CREATE TABLE discipline (
    id_discipline INT PRIMARY KEY,
    year INT
);


CREATE TABLE study_subgroup (
    id_study_subgroup INT PRIMARY KEY,
    FOREIGN KEY (id_discipline) REFERENCES discipline(id_discipline)
);


CREATE TABLE student (
    id_student INT PRIMARY KEY,
    number_of_group INT,
    name VARCHAR(50),
    year INT
);

CREATE TABLE operator (
    id_operator INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(30),
    prone_number VARCHAR(20) 
);

CREATE TABLE deadline (
    id_deadline INT PRIMARY KEY,
    time_date DATETIME,
    link_to_folder_with_tasks VARCHAR(30),
    time_date_of_setting DATETIME #default getdate() (МОЖНО ЧТО-НИБУДЬ ТАКОЕ СДЕЛАТЬ только со временем),
    FOREIGN KEY (id_operator) REFERENCES operator(id_operator)
);

CREATE TABLE announcement (
    id_announcement INT PRIMARY KEY,
    time_date_of_setting DATETIME,
    FOREIGN KEY (id_operator) REFERENCES operator(id_operator)
);



CREATE TABLE class_study_subgroup (
    FOREIGN KEY (id_class) REFERENCES class(id_class),
    FOREIGN KEY (id_study_subgroup) REFERENCES study_subgroup(id_study_subgroup),
    PRIMARY KEY(id_class, id_study_subgroup),
    start_time_date DATETIME,
    format VARCHAR(10), 
    venue VARCHAR(50)
);


CREATE TABLE class_operator (
    FOREIGN KEY (id_class) REFERENCES class(id_class),
    FOREIGN KEY (id_operator) REFERENCES operator(id_operator),
    PRIMARY KEY(id_class, id_operator),
    priority INT #(?)
);


CREATE TABLE study_subgroup_student (
    FOREIGN KEY (id_study_subgroup) REFERENCES study_subgroup(id_study_subgroup),
    FOREIGN KEY (id_student) REFERENCES student(id_student),
    PRIMARY KEY(id_study_subgroup, id_student)
);

CREATE TABLE study_subgroup_announcement (
    FOREIGN KEY (id_study_subgroup) REFERENCES study_subgroup(id_study_subgroup),
    FOREIGN KEY (id_announcement) REFERENCES announcement(id_announcement),
    PRIMARY KEY(id_study_subgroup, id_announcement)
);

CREATE TABLE study_subgroup_deadline (
    FOREIGN KEY (id_study_subgroup) REFERENCES study_subgroup(id_study_subgroup),
    FOREIGN KEY (id_deadline) REFERENCES deadline(id_deadline),
    PRIMARY KEY(id_study_subgroup, id_deadline)
);





