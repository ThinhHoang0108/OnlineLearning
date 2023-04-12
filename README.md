# Online Learning Website - Assignment ISP392 - IS1603

*The main project folder that for learning, practicing and taking assignment score in class*

## You will find in this repo the following stuff:
* The Java web source used to develop online learning website
* Register an account with your username and password
* Automatically send email verify after register
* Authorizing client, user, admin by filter
* Practicing quiz, instructional videos, and a personalized learning dashboard
* Paging or load more course don't reload page by using ajax
* ...

## Table of Contents

- [Description](#description)

- [Preview Screenshot](#preview-screenshot)

- [Technology](#technology)

- [Functional requirements](#functional-requirements)

- [Useful Resources](#useful-resources)

## Description

- This web application is my team project under the requirement of teacher in class
- For students who do not have enough finance and want to learn new knowledge in participating, and in the Internet in general. Every day, they use laptops so they want to interact easily.
- This website also contains a function for admin for managing
- This web works well on desktop, I also added responsive for it, maybe it can work on tablet, mobile
- Online Learning has a few following benefits: Saving time because they don’t go to Academy or still have enough information from courses when learning courses. Saving more money than going to Academy.

## Preview Screenshot

<div  align="center">

<img  src="https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/preview/HomePage2.png"  alt="Home Page"  width="45%"></img> &nbsp;&nbsp; <img  src="https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/preview/Login.png"  alt="Login Bar"  width="45%"></img>

<img  src="https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/preview/CoursePage.png"  alt="Course List"  width="45%"></img> &nbsp;&nbsp; <img  src="https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/preview/CourseDetail.png"  alt="Course Detail"  width="45%"></img>

<img  src="https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/preview/BlogList.png"  alt="Blog List"  width="45%"></img> &nbsp;&nbsp; <img  src="https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/preview/BlogDetail.png"  alt="Blog Detail"  width="45%"></img>

<img  src="https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/preview/DoQuiz.png"  alt="Quiz Simultae"  width="45%"></img> &nbsp;&nbsp; <img  src="https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/preview/QuizReview.png"  alt="Quiz Review"  width="45%"></img>

<img  src="https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/preview/MyTakenQuiz.png"  alt="My Taken Quiz"  width="45%"></img> &nbsp;&nbsp; <img  src="https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/preview/Dashboard.png"  alt="Dashboard"  width="45%"></img>

<img  src="https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/preview/ManageQuestion.png"  alt="QuestionList"  width="45%"></img> &nbsp;&nbsp; <img  src="https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/preview/ManageQuestion2.png"  alt="Add Question"  width="45%"></img>

<img  src="https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/preview/ManageQuiz.png"  alt="QuizList"  width="45%"></img> &nbsp;&nbsp; <img  src="https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/preview/ManageQuiz2.png"  alt="Add Quiz"  width="45%"></img>


</div>

## Technology

**1. Frontend**

<div>
  <div>
  <img src ="https://img.icons8.com/arcade/64/null/html-5.png" alt="HTML5 logo" width="4%" title='HTML5'/>
  <img src ="https://img.icons8.com/color/48/null/css3.png" alt="CSS3 logo" width="4%" title='CSS3'/>
  <img src ="https://img.icons8.com/color/48/null/bootstrap.png" alt="Bootstrap logo" width="4%" title='Bootstrap'/>
  <img src ="https://img.icons8.com/color/48/null/javascript--v1.png" alt="JavaScript logo" width="4%" title='JavaScript'/>
  <img src ="https://img.icons8.com/ios-filled/50/null/jsp.png" alt="ES6 logo" width="4%" title='Java Scripting Preprocessor'/>
  <img src ="https://simpleicons.org/icons/axios.svg" width="4%" title='Axios'/>
  <div> 
<div>

**2. Backend** 

  <div>
  <img src ="https://itphutran.com/wp-content/uploads/2017/05/V%C3%AD-d%E1%BB%A5-v%E1%BB%81-Servlet.png" alt="CSS3 logo" width="4%" title='JSP/Servlet'/>
  <div> 

**3. Database**

  <div>
  <img src ="https://img.icons8.com/color/48/null/microsoft-sql-server.png" alt="HTML5 logo" width="4%" title='Microsoft SQL Server'/>
  <div> 

**4. Tool**

<div>
  <img src ="https://img.icons8.com/windows/32/null/netbeans.png" alt="HTML5 logo" width="4%" title='NetBeans'/>
  <img src ="https://img.icons8.com/fluency/48/null/figma.png" alt="CSS3 logo" width="4%" title='Figma'/>
  <img src ="https://img.icons8.com/color/48/null/tomcat.png" width="4%" title='Tomcat'/>
  <img src ="https://img.icons8.com/ios-filled/50/null/github.png" width="4%" title='Github'/>
  <img src ="https://img.icons8.com/fluency/48/null/java-coffee-cup-logo.png" width="4%" title='Java JDK'/>
<div>

**5.Libraries**

- Lombok
- JSTL
- sqljdbc4
- javax.mail
- javax.activation-1.2.0

## Functional requirements

**1. Guest:**
- [x] Login by account
- [x] Register an account
- [x] Search, view courses
- [x] View blogs
- [x] View courses detail
- [x] View blog's comment
- [ ] Password retrieval

**2. User**
- [x] Search, view plants
- [x] Add, update, remove course registration
- [x] View blogs
- [x] View blog's comment
- [x] Logout
- [x] Update account information
- [x] Practice Quiz
- [x] Comment blogs
- [x] View taken quiz score, true/false answering


**4. Admin:**
- [x] Managing courses
- [x] Managing lessons
- [x] Managing accounts
- [x] Managing slide
- [x] Managing quiz
- [x] Managing question
- [x] Send email
- [x] Update admin account information
- [ ] Statistic revenue

## Useful Resources

#| Name | Description
-| ---- | -----------
1| [web folder](https://github.com/ThinhHoang0108/OnlineLearning/tree/master/ISP392/web) | -----------
2| [src folder](https://github.com/ThinhHoang0108/OnlineLearning/tree/master/ISP392/src/java) | -----------
3| [Database file](https://github.com/ThinhHoang0108/OnlineLearning/blob/master/ISP392/script.sql) | -----------
4| [libs folder](https://github.com/ThinhHoang0108/OnlineLearning/tree/master/ISP392/lib) | -----------

## Individual Stats

![Thinh GitHub stats](https://github-readme-stats.vercel.app/api?username=Thinhhxhe161617&show_icons=true&theme=transparent)

