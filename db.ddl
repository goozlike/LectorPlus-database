CREATE DATABASE LectorPLus;

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
    id_discipline INT,
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
    phone_number VARCHAR(20) 
);

CREATE TABLE deadline (
    id_deadline INT PRIMARY KEY,
    time_date DATETIME,
    link_to_folder_with_tasks VARCHAR(30),
    time_date_of_setting DATETIME,
    id_operator INT,
    FOREIGN KEY (id_operator) REFERENCES operator(id_operator)
);

CREATE TABLE announcement (
    id_announcement INT PRIMARY KEY,
    time_date_of_setting DATETIME,
    id_operator INT, 
    FOREIGN KEY (id_operator) REFERENCES operator(id_operator)
);



CREATE TABLE class_study_subgroup (
    id_class INT,
    id_study_subgroup INT, 
    FOREIGN KEY (id_class) REFERENCES class(id_class),
    FOREIGN KEY (id_study_subgroup) REFERENCES study_subgroup(id_study_subgroup),
    CONSTRAINT PK_class_group PRIMARY KEY(id_class, id_study_subgroup),
    start_time_date DATETIME,
    format VARCHAR(10), 
    venue VARCHAR(50)
);


CREATE TABLE class_operator (
    id_class INT,
    id_operator INT,
    priority INT, 
    FOREIGN KEY (id_class) REFERENCES class(id_class),
    FOREIGN KEY (id_operator) REFERENCES operator(id_operator),
    CONSTRAINT PK_class_op PRIMARY KEY (id_class, id_operator),
);


CREATE TABLE study_subgroup_student (
    id_study_subgroup INT,
    id_student INT, 
    FOREIGN KEY (id_study_subgroup) REFERENCES study_subgroup(id_study_subgroup),
    FOREIGN KEY (id_student) REFERENCES student(id_student),
    CONSTRAINT PK_group_stud PRIMARY KEY (id_study_subgroup, id_student)
);

CREATE TABLE study_subgroup_announcement (
    id_study_subgroup INT,
    id_announcement INT, 
    FOREIGN KEY (id_study_subgroup) REFERENCES study_subgroup(id_study_subgroup),
    FOREIGN KEY (id_announcement) REFERENCES announcement(id_announcement),
    CONSTRAINT PK_group_ann PRIMARY KEY (id_study_subgroup, id_announcement)
);

CREATE TABLE study_subgroup_deadline (
    id_study_subgroup INT,
    id_deadline INT, 
    FOREIGN KEY (id_study_subgroup) REFERENCES study_subgroup(id_study_subgroup),
    FOREIGN KEY (id_deadline) REFERENCES deadline(id_deadline),
    CONSTRAINT PK_group_dedl PRIMARY KEY (id_study_subgroup, id_deadline)
);
