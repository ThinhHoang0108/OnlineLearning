CREATE DATABASE [ISP392]
USE [ISP392]
CREATE TABLE [User] (
  [ID] int IDENTITY(1,1),
  [Name] varchar(50),
  [Dateofbirth] date,
  [PhoneNumber] varchar(10),
  [Username] varchar(50),
  [Password] varchar(50),
  PRIMARY KEY ([ID])
);

CREATE TABLE [Role] (
  [ID] int IDENTITY(1,1),
  [Position] varchar(15),
  PRIMARY KEY ([ID])
);

CREATE TABLE [Assign] (
  [IDuser] int FOREIGN KEY REFERENCES [User]([ID]),
  [IDrole] int FOREIGN KEY REFERENCES [Role]([ID]),
  PRIMARY KEY ([IDuser], [IDrole])
);

CREATE TABLE [Category] (
  [ID] int IDENTITY(1,1),
  [Name] VARCHAR(50),
  PRIMARY KEY ([ID])
);

CREATE TABLE [Topic] (
  [ID] int IDENTITY(1,1),
  [Name] VARCHAR(50),
  PRIMARY KEY ([ID]),
  [IDcategory] int FOREIGN KEY REFERENCES [Category]([ID]),

);

CREATE TABLE [Blog] (
  [ID] int IDENTITY(1,1),
  [Thumnail] VARCHAR(MAX),
  [content] varchar(MAX),
  [Description] varchar(MAX),
  [IDuser] int FOREIGN KEY REFERENCES [User]([ID]),
  [IDtopic] int FOREIGN KEY REFERENCES [Topic]([ID]),
  [IDcategory] int FOREIGN KEY REFERENCES [Category]([ID]),
  PRIMARY KEY ([ID]),
);

CREATE TABLE [Course] (
  [ID] int IDENTITY(1,1),
  [Thumnail] varchar(MAX),
  [Content] varchar(MAX),
  [Description] varchar(MAX),
  [Price] int,
  [DateCreated] date,
  [IDtopic] int FOREIGN KEY REFERENCES [Topic]([ID]),
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

insert into [User] (Name, Dateofbirth, PhoneNumber, Username, Password) values ('Giulietta', '2022-02-26', '2649787684', 'gflowitt0', 'A9cqcUiD');
insert into [User] (Name, Dateofbirth, PhoneNumber, Username, Password) values ('Ahmed', '2003-12-18', '4267209759', 'amccandie1', 'iiGg574pw');
insert into [User] (Name, Dateofbirth, PhoneNumber, Username, Password) values ('Zulema', '2018-07-12', '8426857686', 'zpadbury2', 'ujDSAmv1tarl');
insert into [User] (Name, Dateofbirth, PhoneNumber, Username, Password) values ('Christabel', '2000-06-07', '9021201342', 'clillyman3', 'IqvThuJ3z');
insert into [User] (Name, Dateofbirth, PhoneNumber, Username, Password) values ('Marchall', '2004-11-21', '3817200366', 'mbettaney4', 'QahiYqhQpn');

insert into [Category] (Name) values ('Topic');
insert into [Category] (Name) values ('Course');
insert into [Category] (Name) values ('Subject');
insert into [Category] (Name) values ('Blog');

insert into [Topic] (Name,IDcategory) values ('Digital Marketing',1);
insert into [Topic] (Name,IDcategory) values ('Accounting',1);
insert into [Topic] (Name,IDcategory) values ('Sale',1);
