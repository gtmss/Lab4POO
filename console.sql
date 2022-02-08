
CREATE TABLE Doctors (
    PersonalID int,
    LastName varchar(255),
    FirstName varchar(255),
    Department varchar(255),
    Experince int,
    PRIMARY KEY (PersonalID)
);

CREATE TABLE Clients (
    PersonalID int,
    LastName varchar(255),
    FirstName varchar(255),
    Adress varchar(255),
    TypeOfInjury varchar(255),
    AssignedDocID int,
    TimePhoneCall varchar(20),
    FOREIGN KEY (AssignedDocID) REFERENCES Doctors(PersonalID)
);

CREATE TABLE Technical_stuff (
    PersonalID int,
    LastName varchar(255),
    FirstName varchar(255),
    Department varchar(255),
    WorkHours int
);

-- Doctors Table
insert into Doctors values (1422,'Orescu', 'Petru', 'Traumatologie', 15 );
insert into Doctors values (7111,'Orescu', 'Vasile', 'Traumatologie', 12 );
insert into Doctors values (8112,'Ceban', 'Laurentiu', 'Traumatologie', 7 );
insert into Doctors values (8815,'Olaru', 'Veceslav', 'Reanimare', 22 );
insert into Doctors values (8816,'Popescu', 'Pantilimon', 'Onclogie', 22 );
-- Clients Table
insert into Clients (PersonalID, LastName, FirstName, Adress, TypeOfInjury, AssignedDocID,TimePhoneCall)
values (3321, 'Cepraga', 'Leomid', 'Str. Mihai Viteazu 12, Chisinau', 'Fracura deschisa...', 1422, '079856432'),
       (1234, 'Stirbu', 'Stefan', 'Str. Vasile Lupu 2, Orhei', 'Fractura craniana', 7111, '35647987987'),
       (1298, 'Sova', 'Nicolae', 'Str. Aleco Ruso 5, Orhei', 'Leziune a ochiului...', 8112, '09924445'),
       (2345, 'Caldare', 'Alexandru', 'Ciocalteni', 'Fractura mana stanga...', 8815, '022231334'),
       (9934, 'Popovici', 'Gheorghe', 'Str. Braviceni 25, Chisinau', 'Delirium', 8816, '099222334'),
       (9001, 'Aur', 'Igor', 'Str. Petricani 19, Ocnița' , 'Cancer intestin,,,', 8816, '0358231334');
-- Technical Stuff Table
insert into technical_stuff (PersonalID, LastName, FirstName, Department, WorkHours)
values (0199, 'Gheorghiu', 'Ion', 'Contabilitate', '38'),
       (0192, 'Siritanu', 'Dumitru', 'Transport Auto', '48'),
       (0193, 'Istrati', 'Eugen', 'Electroenergetica', '48');

--Selection
select * from doctors where Department = 'Traumatologie';
select * from  clients where FirstName = 'Petru';
select * from technical_stuff where WorkHours >= 40;
select * from technical_stuff order by WorkHours desc;
select PersonalID from technical_stuff;
--delete
delete from clients where LastName = 'Caldare';
delete from doctors where personalid = 3321;
--update
update technical_stuff set workhours = 36 where workhours = 48;

----------------------JOINS-------------------------------------------------
--INNER JOIN
select Department, Clients.PersonalID, Doctors.PersonalID
from Doctors
         inner join Clients ON Doctors.PersonalID = Clients.AssignedDocID;
--LEFT JOIN
insert into Doctors (PersonalID, LastName, FirstName) values (0303, 'Miahil', 'Lungu');
select Department
from Doctors
         left join Clients C on Doctors.PersonalID = C.AssignedDocID;
-- RIGHT JOIN
select Department, C.FirstName, C.LastName, C.TypeOfInjury
from Doctors
        right join Clients C on Doctors.PersonalID = C.AssignedDocID
