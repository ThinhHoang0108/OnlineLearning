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
  [Name] varchar,
  PRIMARY KEY ([ID])
);

CREATE TABLE [Topic] (
  [ID] int,
  [Name] varchar,
  PRIMARY KEY ([ID]),
  [IDcategory] int FOREIGN KEY REFERENCES [Category]([ID]),

);

CREATE TABLE [Blog] (
  [ID] int IDENTITY(1,1),
  [Thumnail] varchar,
  [content] varchar,
  [Description] varchar,
  [IDuser] int FOREIGN KEY REFERENCES [User]([ID]),
  [IDtopic] int FOREIGN KEY REFERENCES [Topic]([ID]),
  [IDcategory] int FOREIGN KEY REFERENCES [Category]([ID]),
  PRIMARY KEY ([ID]),
);

CREATE TABLE [Course] (
  [ID] int IDENTITY(1,1),
  [Thumnail] varchar,
  [Content] varchar,
  [Description] varchar,
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
  [Content] varchar,
  [Description] varchar,
  [IDcategory] int FOREIGN KEY REFERENCES [Category]([ID]),
  [IDcourse] int FOREIGN KEY REFERENCES [Course]([ID]),
  PRIMARY KEY ([ID])
);


CREATE TABLE [QuestionBank] (
  [ID] int IDENTITY(1,1),
  [Question] varchar,
  [Answer] varchar,
  [Level] int,
  [IDsubject] int FOREIGN KEY REFERENCES [Subject]([ID]),
  [IDcourse] int FOREIGN KEY REFERENCES [Course]([ID]),
  PRIMARY KEY ([ID])
);


CREATE TABLE [Quizz] (
  [ID] int IDENTITY(1,1),
  [content] varchar,
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

CREATE TABLE [QuiizzHave] (
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

