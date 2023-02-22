CREATE DATABASE [ISP392]
USE [ISP392]
CREATE TABLE [Role] (
  [ID] int IDENTITY(1,1),
  [Position] varchar(15),
  PRIMARY KEY ([ID])
);
CREATE TABLE [User] (
  [ID] int IDENTITY(1,1),
  [Name] varchar(50),
  [Dateofbirth] date,
  [PhoneNumber] varchar(10),
  [Username] varchar(50),
  [email] varchar(50),	
  [Password] varchar(50),
  PRIMARY KEY ([ID]),
  [IDrole] int FOREIGN KEY REFERENCES [Role]([ID])
);
CREATE TABLE [Category] (
  [ID] int IDENTITY(1,1),
  [Name] VARCHAR(50),
  PRIMARY KEY ([ID])
);

CREATE TABLE [Blog] (
  [ID] int IDENTITY(1,1),
  [Thumnail] VARCHAR(MAX),
  [content] varchar(MAX),
  [Description] varchar(MAX),
  [IDuser] int FOREIGN KEY REFERENCES [User]([ID]),
  [IDcategory] int FOREIGN KEY REFERENCES [Category]([ID]),
  PRIMARY KEY ([ID]),
);

CREATE TABLE [Course] (
  [ID] int IDENTITY(1,1),
  [Thumnail] varchar(MAX),
  [Content] varchar(MAX),
  [Description] varchar(MAX),
  [DateCreated] date,
  [IDcategory] int FOREIGN KEY REFERENCES [Category]([ID]),
  PRIMARY KEY ([ID])
);

CREATE TABLE [Register] (
  [IDcourse] int FOREIGN KEY REFERENCES [Course]([ID]),
  [IDuser] int FOREIGN KEY REFERENCES [User]([ID]),
  PRIMARY KEY ([IDcourse], [IDuser]),
);

CREATE TABLE [Subject] (
  [ID] int IDENTITY(1,1),
  [Content] varchar(MAX),
  [Description] varchar(MAX),
  [IDcategory] int FOREIGN KEY REFERENCES [Category]([ID]),
  [IDcourse] int FOREIGN KEY REFERENCES [Course]([ID]),
  PRIMARY KEY ([ID])
);


CREATE TABLE [QuestionBank] (
  [ID] int IDENTITY(1,1),
  [Question] varchar(MAX),
  [Answer] varchar(MAX),
  [Level] int,
  [IDsubject] int FOREIGN KEY REFERENCES [Subject]([ID]),
  [IDcourse] int FOREIGN KEY REFERENCES [Course]([ID]),
  PRIMARY KEY ([ID])
);


CREATE TABLE [Quizz] (
  [ID] int IDENTITY(1,1),
  [content] varchar(MAX),
  [IDquestionbank] int FOREIGN KEY REFERENCES [QuestionBank]([ID]),
  [IDSubject] int FOREIGN KEY REFERENCES [Subject]([ID]),
  PRIMARY KEY ([ID])
);

CREATE TABLE [Do] (
  [ID] int IDENTITY(1,1),
  [mark] int,
  [IDquizz] int FOREIGN KEY REFERENCES [Quizz]([ID]),
  [IDuser] int FOREIGN KEY REFERENCES [User]([ID]),
  PRIMARY KEY ([ID])
);

CREATE TABLE [Comment] (
  [ID] int IDENTITY(1,1),
  [IDuser] int FOREIGN KEY REFERENCES [User]([ID]),
  [IDblog] int FOREIGN KEY REFERENCES [Blog]([ID]),
  [Content] NVARCHAR(MAX),
  PRIMARY KEY ([ID])
);

CREATE TABLE [Status] (
  [ID] int IDENTITY(1,1),
  [Type] varchar(20),
  PRIMARY KEY ([ID])
);

CREATE TABLE [QuizzHave] (
  [IDquizz] int FOREIGN KEY REFERENCES [Quizz]([ID]),
  [IDstatus] int FOREIGN KEY REFERENCES [Status]([ID]),
  PRIMARY KEY ([IDquizz], [IDstatus])
);

CREATE TABLE [UserHave] (
  [IDuser] int FOREIGN KEY REFERENCES [User]([ID]),
  [IDstatus] int FOREIGN KEY REFERENCES [Status]([ID]),
  PRIMARY KEY ([IDuser], [IDstatus])
);
CREATE TABLE [CourseHave] (
  [IDcourse] int FOREIGN KEY REFERENCES [Course]([ID]),
  [IDstatus] int FOREIGN KEY REFERENCES [Status]([ID]),
  PRIMARY KEY ([IDcourse], [IDstatus])
);

CREATE TABLE [SupjectHave] (
  [IDsupject] int FOREIGN KEY REFERENCES [Subject]([ID]),
  [IDstatus] int FOREIGN KEY REFERENCES [Status]([ID]),
  PRIMARY KEY ([IDsupject], [IDstatus])
);

CREATE TABLE [BlogHave] (
  [IDblog] int FOREIGN KEY REFERENCES [Blog]([ID]),
  [IDstatus] int FOREIGN KEY REFERENCES [Status]([ID]),
  PRIMARY KEY ([IDblog], [IDstatus]),
);
---------User--------------
insert into [User] (Name, Dateofbirth, PhoneNumber, Username, Password) values ('Giulietta', '2022-02-26', '2649787684', 'gflowitt0', 'A9cqcUiD');
insert into [User] (Name, Dateofbirth, PhoneNumber, Username, Password) values ('Ahmed', '2003-12-18', '4267209759', 'amccandie1', 'iiGg574pw');
insert into [User] (Name, Dateofbirth, PhoneNumber, Username, Password) values ('Zulema', '2018-07-12', '8426857686', 'zpadbury2', 'ujDSAmv1tarl');
insert into [User] (Name, Dateofbirth, PhoneNumber, Username, Password) values ('Christabel', '2000-06-07', '9021201342', 'clillyman3', 'IqvThuJ3z');
insert into [User] (Name, Dateofbirth, PhoneNumber, Username, Password) values ('Marchall', '2004-11-21', '3817200366', 'mbettaney4', 'QahiYqhQpn');
INSERT INTO dbo.[User] (Name,Dateofbirth,PhoneNumber,Username,Password,IDrole) VALUES ('Hoang Xuan Thinh', '2002-01-01', '123123123', 'thinh1', '1', '3')
INSERT INTO dbo.[User] (Name,Dateofbirth,PhoneNumber,Username,Password,IDrole) VALUES ('Vu Xuan Thang', '2002-01-01', '123123123', 'thang1', '1', '3')
INSERT INTO dbo.[User] (Name,Dateofbirth,PhoneNumber,Username,Password,IDrole) VALUES ('Nguyen Minh Tuan', '2002-01-01', '123123123', 'tuan1', '1', '3')
INSERT INTO dbo.[User] (Name,Dateofbirth,PhoneNumber,Username,Password,IDrole) VALUES ('Tran Huong Ly', '2002-01-01', '123123123', 'ly1', '1', '3')
---------Course--------------
insert into [Category] (Name) values ('Topic');
insert into [Category] (Name) values ('Course');
insert into [Category] (Name) values ('Subject');
insert into [Category] (Name) values ('Blog');
---------Course--------------
insert into Course  (Thumnail, Content, Description, DateCreated, IDcategory) values ('http://dummyimage.com/800x533.png/ff4444/ffffff', 'Disp fx of posterior wall of left acetab, init for opn fx', 'Displaced fracture of posterior wall of left acetabulum, initial encounter for open fracture', '2022-03-21', 2);
insert into Course  (Thumnail, Content, Description, DateCreated, IDcategory) values ('http://dummyimage.com/800x533.png/cc0000/ffffff', 'Other epilepsy, not intractable, without status epilepticus', 'Other epilepsy, not intractable, without status epilepticus', '2022-10-17', 4);
insert into Course  (Thumnail, Content, Description, DateCreated, IDcategory) values ('http://dummyimage.com/800x533.png/dddddd/000000', 'Sltr-haris Type III physl fx lower end humer, unsp arm, 7thP', 'Salter-Harris Type III physeal fracture of lower end of humerus, unspecified arm, subsequent encounter for fracture with malunion', '2022-02-28', 2);
insert into Course  (Thumnail, Content, Description, DateCreated, IDcategory) values ('http://dummyimage.com/800x533.png/dddddd/000000', 'Laceration w/o foreign body of right shoulder, subs encntr', 'Laceration without foreign body of right shoulder, subsequent encounter', '2022-04-04', 3);
insert into Course  (Thumnail, Content, Description, DateCreated, IDcategory) values ('http://dummyimage.com/800x533.png/cc0000/ffffff', 'Lacerat musc and tendons at ank/ft level, unsp foot, sequela', 'Laceration of other specified muscles and tendons at ankle and foot level, unspecified foot, sequela', '2022-07-18', 4);
insert into Course  (Thumnail, Content, Description, DateCreated, IDcategory) values ('http://dummyimage.com/800x533.png/cc0000/ffffff', 'Unsp fracture of left femur, subs for clos fx w routn heal', 'Unspecified fracture of left femur, subsequent encounter for closed fracture with routine healing', '2022-10-14', 2);
insert into Course  (Thumnail, Content, Description, DateCreated, IDcategory) values ('http://dummyimage.com/800x533.png/dddddd/000000', 'Disord of amnio fluid and membrns, unsp, third tri, fetus 4', 'Disorder of amniotic fluid and membranes, unspecified, third trimester, fetus 4', '2022-11-10', 2);
insert into Course  (Thumnail, Content, Description, DateCreated, IDcategory) values ('http://dummyimage.com/800x533.png/5fa2dd/ffffff', 'Fracture of xiphoid process, init encntr for open fracture', 'Fracture of xiphoid process, initial encounter for open fracture', '2022-08-12', 1);
insert into Course  (Thumnail, Content, Description, DateCreated, IDcategory) values ('http://dummyimage.com/800x533.png/5fa2dd/ffffff', 'Galeazzi''s fx unsp rad, 7thJ', 'Galeazzi''s fracture of unspecified radius, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing', '2022-12-25', 3);
insert into Course  (Thumnail, Content, Description, DateCreated, IDcategory) values ('http://dummyimage.com/800x533.png/cc0000/ffffff', 'Disp fx of base of nk of unsp femr, 7thM', 'Displaced fracture of base of neck of unspecified femur, subsequent encounter for open fracture type I or II with nonunion', '2022-04-25', 2);
------------------Subject----------------------
insert into [Subject] (Content, Description, IDcategory, IDcourse, Thumnail) VALUES ('Hello World', 'Learn Python: The Complete Python Programming Course', 1, 1, 'http://dummyimage.com/800x533.png/5fa2dd/ffffff')
insert into [Subject] (Content, Description, IDcategory, IDcourse, Thumnail) VALUES ('Data Types and Ints', 'A data type is an attribute of a piece of data that tells a device how the end-user might interact with the data. You can also think of them as categorizations that different coding programs might combine in order to execute certain functions. Most programming languages including C++ and Java use the same basic data types.', 1, 1, 'http://dummyimage.com/800x533.png/ff4444/ffffff')
insert into [Subject] (Content, Description, IDcategory, IDcourse, Thumnail) VALUES ('Strings', 'In computer programming, a string is traditionally a sequence of characters, either as a literal constant or as some kind of variable. The latter may allow its elements to be mutated and the length changed, or it may be fixed (after creation). A string is generally considered as a data type and is often implemented as an array data structure of bytes (or words) that stores a sequence of elements, typically characters, using some character encoding. String may also denote more general arrays or other sequence (or list) data types and structures.', 1, 1, 'http://dummyimage.com/800x533.png/5fa2dd/ffffff')
---------------------Role----------------------
INSERT INTO dbo.Role (Position) VALUES ('Guest')
INSERT INTO dbo.Role (Position) VALUES ('User')
INSERT INTO dbo.Role (Position) VALUES ('Admin')
