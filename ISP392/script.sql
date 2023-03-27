CREATE DATABASE [ISP392_REP1]
USE [ISP392_REP1]
CREATE TABLE [Role] (
  [ID] int IDENTITY(1,1),
  [Position] varchar(15),
  PRIMARY KEY ([ID])
);

CREATE TABLE [User] (
  [ID] int IDENTITY(1,1),
  [Name] varchar(50),
  [Dateofbirth] date,
  [Username] varchar(50),
  [Password] varchar(50),
  [PhoneNumber] varchar(10),
  [IDrole] [int],
  [email] varchar(50),
  PRIMARY KEY ([ID]),
  CONSTRAINT [FK_User.IDrole]
    FOREIGN KEY ([IDrole])
      REFERENCES [Role]([ID])
);

CREATE TABLE [Category] (
  [ID] int IDENTITY(1,1),
  [Name] VARCHAR(50),
  PRIMARY KEY ([ID])
);

CREATE TABLE [Course] (
  [ID] int IDENTITY(1,1),
  [Thumnail] varchar(MAX),
  [Content] varchar(MAX),
  [DateCreated] DATETIME DEFAULT  (getdate()),
  [Description] varchar(MAX),
  [IDcategory] [int],
  PRIMARY KEY ([ID]),
  CONSTRAINT [FK_Course.IDcategory]
    FOREIGN KEY ([IDcategory])
      REFERENCES [Category]([ID])
);

CREATE TABLE [Lesson] (
  [ID] int IDENTITY(1,1),
  [urlVideo] varchar(MAX),
  [IDcourse] [int],
  [Content] varchar(255),
  [Description] varchar(MAX),
  PRIMARY KEY ([ID]),
  CONSTRAINT [FK_Lesson.IDcourse]
    FOREIGN KEY ([IDcourse])
      REFERENCES [Course]([ID])
);

CREATE TABLE [QuizLevel] (
  [QuizLevelID] [int] IDENTITY(1,1),
  [QuizLevelName] nvarchar(63),
  PRIMARY KEY ([QuizLevelID])
);

CREATE TABLE [Quizz] (
  [ID] [int] IDENTITY(1,1),
  [content] [varchar](255),
  [LevelID] [int],
  [start_time] [time](7),
  [end_time] [time](7),
  [status] [bit],
  [ratePass] [float],
  [courseID] [int],
  [userID] [int],
  [questionID] [int],
  [description] [varchar](max),
  [totalQuestion] [int],
  [attempt] [int],
  [duration] [INT],
  [IDLesson] [int],
  PRIMARY KEY ([ID]),
  CONSTRAINT [FK_Quizz.courseID]
    FOREIGN KEY ([courseID])
      REFERENCES [Course]([ID]),
  CONSTRAINT [FK_Quizz.IDLesson]
    FOREIGN KEY ([IDLesson])
      REFERENCES [Lesson]([ID]),
  CONSTRAINT [FK_Quizz.LevelID]
    FOREIGN KEY ([LevelID])
      REFERENCES [QuizLevel]([QuizLevelID]),
  CONSTRAINT [FK_Quizz.userID]
    FOREIGN KEY ([userID])
      REFERENCES [User]([ID])
);

CREATE TABLE [Register] (
  [regisId] [int] IDENTITY(1,1),
  [regis_Date] DATETIME DEFAULT  (getdate()),
  [status] [varchar](255),
  [courseId] [int],
  [priceId] [int],
  [userId] [int],
  PRIMARY KEY ([regisId]),
  CONSTRAINT [FK_Register.userId]
    FOREIGN KEY ([userId])
      REFERENCES [User]([ID]),
  CONSTRAINT [FK_Register.courseId]
    FOREIGN KEY ([courseId])
      REFERENCES [Course]([ID])
);

CREATE TABLE [Question] (
  [questionID] [int] IDENTITY(1,1),
  [courseID] [int],
  [lessonID] [int],
  [Status] [bit],
  [IDquizz] [int],
  [content] varchar(255),
  [isMultipleChoice] [bit],
  [level] [nvarchar](255),
  PRIMARY KEY ([questionID]),
  CONSTRAINT [FK_Question.lessonID]
    FOREIGN KEY ([lessonID])
      REFERENCES [Lesson]([ID]),
  CONSTRAINT [FK_Question.courseID]
    FOREIGN KEY ([courseID])
      REFERENCES [Course]([ID])
);

CREATE TABLE [Quiz-Question] (
  [quesId] [int],
  [quizId] [int],
  PRIMARY KEY ([quesId], [quizId]),
  CONSTRAINT [FK_Quiz-Question.quesId]
    FOREIGN KEY ([quesId])
      REFERENCES [Question]([questionID]),
  CONSTRAINT [FK_Quiz-Question.quizId]
    FOREIGN KEY ([quizId])
      REFERENCES [Quizz]([ID])
);

CREATE TABLE [Answer] (
  [answerId] [int] IDENTITY(1,1),
  [quesId] [int],
  [content] [varchar](255),
  [correct] [bit],
  PRIMARY KEY ([answerId]),
  CONSTRAINT [FK_Answer.quesId]
    FOREIGN KEY ([quesId])
      REFERENCES [Question]([questionID])
);


CREATE TABLE [AnswerDetail] (
  [id] [int] IDENTITY(1,1),
  [questionId] [int],
  [answerId] [int],
  [userId] [int],
  [quizId] [int],
  [attempt] [int],
  PRIMARY KEY ([id]),
  CONSTRAINT [FK_AnswerDetail.answerId]
    FOREIGN KEY ([answerId])
      REFERENCES [Answer]([answerId]),
  CONSTRAINT [FK_AnswerDetail.questionId]
    FOREIGN KEY ([questionId])
      REFERENCES [Question]([questionID]),
  CONSTRAINT [FK_AnswerDetail.quizId]
    FOREIGN KEY ([quizId])
      REFERENCES [Quizz]([ID]),
  CONSTRAINT [FK_AnswerDetail.userId]
    FOREIGN KEY ([userId])
      REFERENCES [User]([ID])
);

CREATE TABLE [Quiz_POINT] (
  [ID] [int] IDENTITY(1,1),
  [userID] [int],
  [quizID] [int],
  [point] [float],
  [taken_date] [date],
  [pointPercent] [float],
  [numQuesTrue] [float],
  [attempt] [int],
  PRIMARY KEY ([ID]),
  CONSTRAINT [FK_Quiz_POINT.quizID]
    FOREIGN KEY ([quizID])
      REFERENCES [Quizz]([ID]),
  CONSTRAINT [FK_Quiz_POINT.userID]
    FOREIGN KEY ([userID])
      REFERENCES [User]([ID])
);

CREATE TABLE [Slide] (
  [sliderId]  [int] IDENTITY(1,1),
  [slider_url] [varchar](255),
  [status] [bit],
  [title] [varchar](255),
  [content] [varchar](255),
  [backlink] [varchar](255),
  [notes] [varchar](255),
  [isShow] [bit],
  [courseID] [int],
  PRIMARY KEY ([sliderId]),
  CONSTRAINT [FK_Slide.courseID]
    FOREIGN KEY ([courseID])
      REFERENCES [Course]([ID])
);

CREATE TABLE [Blog] (
  [ID] int IDENTITY(1,1),
  [Thumnail] VARCHAR(MAX),
  [content] varchar(MAX),
  [Description] varchar(MAX),
  [created_date] DATETIME DEFAULT  (getdate()),
  [IDuser] [int],
  [IDcategory] [int],
  PRIMARY KEY ([ID]),
  CONSTRAINT [FK_Blog.IDcategory]
    FOREIGN KEY ([IDcategory])
      REFERENCES [Category]([ID]),
  CONSTRAINT [FK_Blog.IDuser]
    FOREIGN KEY ([IDuser])
      REFERENCES [User]([ID])
);

CREATE TABLE [Comment] (
  [ID] [int] IDENTITY(1,1),
  [IDuser] [int],
  [IDblog] [int],
  [Content] varchar(MAX),
  [createDate] DATETIME DEFAULT  (getdate()),
  PRIMARY KEY ([ID]),
  CONSTRAINT [FK_Comment.IDblog]
    FOREIGN KEY ([IDblog])
      REFERENCES [Blog]([ID]),
  CONSTRAINT [FK_Comment.IDuser]
    FOREIGN KEY ([IDuser])
      REFERENCES [User]([ID])
);
---------------------Role----------------------
INSERT INTO dbo.Role (Position) VALUES ('Guest')
INSERT INTO dbo.Role (Position) VALUES ('User')
INSERT INTO dbo.Role (Position) VALUES ('Admin')
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
insert into [Category] (Name) values ('Programming Fundamental');
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
------------------Lesson----------------------
insert into [Lesson] (Content, Description, IDcourse, urlVideo) VALUES ('DAY 1 | print("Hello, World")', 'Learn Python: The Complete Python Programming Course', 1, 'ObuFmlCs2SE')
insert into [Lesson] (Content, Description, IDcourse, urlVideo) VALUES ('DAY 2 | If-Else', 'Learn Python: The Complete Python Programming Course', 1, 'N62rgyoh2Iw')
insert into [Lesson] (Content, Description, IDcourse, urlVideo) VALUES ('DAY 3 | ARITHMETIC OPERATORS', 'Learn Python: The Complete Python Programming Course', 1, 'LnJ_z1YaNck')
insert into [Lesson] (Content, Description, IDcourse, urlVideo) VALUES ('DAY 4 | DIVISION', 'Learn Python: The Complete Python Programming Course', 1, 'UwA7Ud2NLEc')
insert into [Lesson] (Content, Description, IDcourse, urlVideo) VALUES ('DAY 5 | LOOPS', 'Learn Python: The Complete Python Programming Course', 1, 'xhBCpqUR2WI')

-----------------------Blog--------------------
insert into Blog (Thumnail, content, Description) values ('http://dummyimage.com/800x533.png/ff4444/ffffff', 'Tokyo Medical College', 'Dilation of Right External Carotid Artery with Four or More Intraluminal Devices, Percutaneous Approach');
insert into Blog (Thumnail, content, Description) values ('http://dummyimage.com/800x533.png/dddddd/000000', 'Meijo University', 'Immobilization of Right Lower Arm using Splint');
insert into Blog (Thumnail, content, Description) values ('http://dummyimage.com/800x533.png/dddddd/000000', 'University College of Borås', 'Dilation of Left Internal Mammary Artery with Intraluminal Device, Percutaneous Approach');
insert into Blog (Thumnail, content, Description) values ('http://dummyimage.com/800x533.png/dddddd/000000', 'Anambra State University of Science and Technology', 'Bypass Left Common Iliac Vein to Lower Vein with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach');
insert into Blog (Thumnail, content, Description) values ('http://dummyimage.com/800x533.png/dddddd/000000', 'Tata Institute of Social Sciences', 'Reposition Right Temporal Bone, External Approach');

