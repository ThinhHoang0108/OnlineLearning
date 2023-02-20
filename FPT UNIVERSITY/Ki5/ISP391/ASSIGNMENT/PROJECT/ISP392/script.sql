CREATE DATABASE [ISP392]
USE [ISP392]
CREATE TABLE [User] (
  [ID] int IDENTITY(1,1),
  [Name] varchar(50),
  [Dateofbirth] date,
  [PhoneNumber] varchar(10),
  [Username] varchar(50),
  [Password] varchar(50),
  PRIMARY KEY ([ID]),
  [IDrole] int FOREIGN KEY REFERENCES [Role]([ID])
);

CREATE TABLE [Role] (
  [ID] int IDENTITY(1,1),
  [Position] varchar(15),
  PRIMARY KEY ([ID])
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
---------Course--------------
insert into [Category] (Name) values ('Topic');
insert into [Category] (Name) values ('Course');
insert into [Category] (Name) values ('Subject');
insert into [Category] (Name) values ('Blog');
---------Course--------------
insert into Course (Thumnail, Content, Description, DateCreated, IDtopic, IDcategory) values ('http://dummyimage.com/800x533.png/cc0000/ffffff', 'Injury of unspecified nerve at ankle and foot level, left leg, initial encounter', 'Displaced fracture of neck of scapula, left shoulder, initial encounter for open fracture', '3/13/2022', 3, 2);
insert into Course (Thumnail, Content, Description, DateCreated, IDtopic, IDcategory) values ('http://dummyimage.com/800x533.png/dddddd/000000', 'Cellulitis of buttock', 'Charcot''s joint, wrist', '6/18/2022', 3, 1);
insert into Course (Thumnail, Content, Description, DateCreated, IDtopic, IDcategory) values ('http://dummyimage.com/800x533.png/5fa2dd/ffffff', 'Burn of second degree of multiple left fingers (nail), including thumb, subsequent encounter', 'Blister (nonthermal) of left shoulder, subsequent encounter', '12/25/2022', 2, 1);
insert into Course (Thumnail, Content, Description, DateCreated, IDtopic, IDcategory) values ('http://dummyimage.com/800x533.png/5fa2dd/ffffff', 'Poisoning by centrally-acting and adrenergic-neuron-blocking agents, accidental (unintentional)', 'Malignant neoplasm of other parts of pancreas', '1/20/2023', 1, 4);
insert into Course (Thumnail, Content, Description, DateCreated, IDtopic, IDcategory) values ('http://dummyimage.com/800x533.png/dddddd/000000', 'Unspecified open wound, right knee, initial encounter', 'Non-pressure chronic ulcer of buttock limited to breakdown of skin', '5/3/2022', 1, 4);
insert into Course (Thumnail, Content, Description, DateCreated, IDtopic, IDcategory) values ('http://dummyimage.com/800x533.png/dddddd/000000', 'Other injury of extensor muscle, fascia and tendon of left little finger at forearm level, subsequent encounter', 'Cardiac murmurs and other cardiac sounds', '8/25/2022', 2, 1);
insert into Course (Thumnail, Content, Description, DateCreated, IDtopic, IDcategory) values ('http://dummyimage.com/800x533.png/5fa2dd/ffffff', 'Poisoning by unspecified systemic antibiotic, accidental (unintentional)', 'Other reactive arthropathies, ankle and foot', '6/17/2022', 3, 3);
insert into Course (Thumnail, Content, Description, DateCreated, IDtopic, IDcategory) values ('http://dummyimage.com/800x533.png/dddddd/000000', 'Nondisplaced fracture of medial phalanx of left lesser toe(s), subsequent encounter for fracture with malunion', 'Unspecified pedal cyclist injured in collision with railway train or railway vehicle in nontraffic accident', '1/22/2023', 3, 3);
insert into Course (Thumnail, Content, Description, DateCreated, IDtopic, IDcategory) values ('http://dummyimage.com/800x533.png/dddddd/000000', 'External constriction of left hand', 'Nondisplaced fracture of medial wall of unspecified acetabulum, subsequent encounter for fracture with routine healing', '3/25/2022', 2, 3);
insert into Course (Thumnail, Content, Description, DateCreated, IDtopic, IDcategory) values ('http://dummyimage.com/800x533.png/5fa2dd/ffffff', 'Other osteoporosis with current pathological fracture, unspecified hand, initial encounter for fracture', 'Salter-Harris Type II physeal fracture of left calcaneus, subsequent encounter for fracture with nonunion', '5/27/2022', 2, 1);
