/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Course;
import model.Lesson;
import model.Question;
import model.QuestionDetail;
import model.Quiz;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class QuestionDAO extends MyDAO {

    public List<Question> getAllQuestionByQuestionID(int quizzID) {
        List<Question> t = new ArrayList<>();
        String xSql = "SELECT * FROM dbo.Question WHERE IDquizz = ?";
        Question x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, quizzID);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Question.builder()
                        .questionID(rs.getInt("questionID"))
                        .courseID(rs.getInt("courseID"))
                        .lessonID(rs.getInt("lessonID"))
                        .status(rs.getBoolean("Status"))
                        .quizID(rs.getInt("IDquizz"))
                        .content(rs.getString("content"))
                        .isMultipleChoice(rs.getBoolean("isMultipleChoice"))
                        .build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public Question getQuestionByID(int questionID) {
        Question x = null;
        xSql = "SELECT * FROM dbo.Question WHERE questionID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, questionID);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = Question.builder()
                        .questionID(rs.getInt("questionID"))
                        .courseID(rs.getInt("courseID"))
                        .lessonID(rs.getInt("lessonID"))
                        .status(rs.getBoolean("Status"))
                        .quizID(rs.getInt("IDquizz"))
                        .content(rs.getString("content"))
                        .isMultipleChoice(rs.getBoolean("isMultipleChoice"))
                        .build();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public int getTotalQuestionByQuizID(int quizzID) {
        try {
            String sql = "SELECT COUNT(questionID) FROM dbo.Question WHERE IDquizz = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, quizzID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTotalQuestion() {
        try {
            String sql = "SELECT COUNT(questionID) FROM dbo.Question";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Question> getAllQuestion() {
        List<Question> t = new ArrayList<>();
        String xSql = "SELECT * FROM dbo.Question";
        Question x;
        try {
            ps = con.prepareStatement(xSql);

            rs = ps.executeQuery();
            while (rs.next()) {
                x = Question.builder()
                        .questionID(rs.getInt("questionID"))
                        .courseID(rs.getInt("courseID"))
                        .lessonID(rs.getInt("lessonID"))
                        .status(rs.getBoolean("Status"))
                        .quizID(rs.getInt("IDquizz"))
                        .content(rs.getString("content"))
                        .isMultipleChoice(rs.getBoolean("isMultipleChoice"))
                        .build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public ArrayList<QuestionDetail> getAllQuestionByPage(int page, int PAGE_SIZE) {
        ArrayList<QuestionDetail> t = new ArrayList<>();
        String xSql = "SELECT * FROM dbo.Question a ORDER BY a.questionId ASC OFFSET (?-1)*? ROW FETCH NEXT ? ROWS ONLY";
        QuestionDetail x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new QuizDao().getQuizByID(rs.getInt("IDquizz"));
                Lesson lesson = new LessonDAO().getLessonByLessonID(rs.getInt("lessonID"));
                Course course = new CourseDAO().getCourseById(rs.getInt("courseID"));
                x = QuestionDetail.builder()
                        .questionID(rs.getInt("questionID"))
                        .quizzID(rs.getInt("IDquizz"))
                        .content(rs.getString("content"))
                        .course(course)
                        .status(rs.getBoolean("Status"))
                        .lesson(lesson)
                        .quiz(quiz)
                        .build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public int getTotalSearch2side(String keyword) {
        try {
            String sql = "SELECT COUNT(q.questionID) FROM dbo.Question q WHERE q.content LIKE '%" + keyword + "%'";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public ArrayList<QuestionDetail> getAllQuestionByPageAndSearch(int page, int PAGE_SIZE, String keyword) {
        ArrayList<QuestionDetail> t = new ArrayList<>();
        String xSql = "SELECT * FROM dbo.Question a WHERE a.content LIKE '%" + keyword + "%' ORDER BY a.questionId ASC OFFSET (?-1)*? ROW FETCH NEXT ? ROWS ONLY";
        QuestionDetail x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new QuizDao().getQuizByID(rs.getInt("IDquizz"));
                Lesson lesson = new LessonDAO().getLessonByLessonID(rs.getInt("lessonID"));
                Course course = new CourseDAO().getCourseById(rs.getInt("courseID"));
                x = QuestionDetail.builder()
                        .questionID(rs.getInt("questionID"))
                        .quizzID(rs.getInt("IDquizz"))
                        .content(rs.getString("content"))
                        .course(course)
                        .status(rs.getBoolean("Status"))
                        .lesson(lesson)
                        .quiz(quiz)
                        .build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public int getTotalSearchBylessonID(String keyword, int lessonID) {
        try {
            String sql = "SELECT COUNT(q.questionID) FROM dbo.Question q WHERE q.content LIKE '%" + keyword + "%' AND q.lessonID = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, lessonID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public ArrayList<QuestionDetail> getAllQuestionByPageAndSearchByLessonID(int page, int PAGE_SIZE, String keyword, int lessonID) {
        ArrayList<QuestionDetail> t = new ArrayList<>();
        String xSql = "SELECT * FROM dbo.Question a WHERE a.content LIKE '%" + keyword + "%' AND a.lessonID = ? ORDER BY a.questionId ASC OFFSET (?-1)*? ROW FETCH NEXT ? ROWS ONLY";
        QuestionDetail x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, lessonID);
            ps.setInt(2, page);
            ps.setInt(3, PAGE_SIZE);
            ps.setInt(4, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new QuizDao().getQuizByID(rs.getInt("IDquizz"));
                Lesson lesson = new LessonDAO().getLessonByLessonID(rs.getInt("lessonID"));
                Course course = new CourseDAO().getCourseById(rs.getInt("courseID"));
                x = QuestionDetail.builder()
                        .questionID(rs.getInt("questionID"))
                        .quizzID(rs.getInt("IDquizz"))
                        .content(rs.getString("content"))
                        .course(course)
                        .status(rs.getBoolean("Status"))
                        .lesson(lesson)
                        .quiz(quiz)
                        .build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public int getTotalSearchByCourseID(String keyword, int courseID) {
        try {
            String sql = "SELECT COUNT(q.questionID) FROM dbo.Question q WHERE q.content LIKE '%" + keyword + "%' AND q.courseID = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, courseID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public ArrayList<QuestionDetail> getAllQuestionByPageAndSearchCourseID(int page, int PAGE_SIZE, String keyword, int courseID) {
        ArrayList<QuestionDetail> t = new ArrayList<>();
        String xSql = "SELECT * FROM dbo.Question a WHERE a.content LIKE '%" + keyword + "%' AND a.courseID = ? ORDER BY a.questionId ASC OFFSET (?-1)*? ROW FETCH NEXT ? ROWS ONLY";
        QuestionDetail x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, courseID);
            ps.setInt(2, page);
            ps.setInt(3, PAGE_SIZE);
            ps.setInt(4, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new QuizDao().getQuizByID(rs.getInt("IDquizz"));
                Lesson lesson = new LessonDAO().getLessonByLessonID(rs.getInt("lessonID"));
                Course course = new CourseDAO().getCourseById(rs.getInt("courseID"));
                x = QuestionDetail.builder()
                        .questionID(rs.getInt("questionID"))
                        .quizzID(rs.getInt("IDquizz"))
                        .content(rs.getString("content"))
                        .course(course)
                        .status(rs.getBoolean("Status"))
                        .lesson(lesson)
                        .quiz(quiz)
                        .build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public int getTotalSearchByCourseIDandLevelID(String keyword, int courseID, int lessonID) {
        try {
            String sql = "SELECT COUNT(q.questionID) FROM dbo.Question q WHERE q.content LIKE '%" + keyword + "%' AND q.courseID = ? AND q.lessonID = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, courseID);
            ps.setInt(2, lessonID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public ArrayList<QuestionDetail> getAllQuestionByPageAndSearchCourseIDLevelID(int page, int PAGE_SIZE, String keyword, int courseID, int lessonID) {
        ArrayList<QuestionDetail> t = new ArrayList<>();
        String xSql = "SELECT * FROM dbo.Question a WHERE a.content LIKE '%" + keyword + "%' AND a.courseID = ? AND q.lessonID = ? ORDER BY a.questionId ASC OFFSET (?-1)*? ROW FETCH NEXT ? ROWS ONLY";
        QuestionDetail x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, courseID);
            ps.setInt(2, lessonID);
            ps.setInt(3, page);
            ps.setInt(4, PAGE_SIZE);
            ps.setInt(5, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new QuizDao().getQuizByID(rs.getInt("IDquizz"));
                Lesson lesson = new LessonDAO().getLessonByLessonID(rs.getInt("lessonID"));
                Course course = new CourseDAO().getCourseById(rs.getInt("courseID"));
                x = QuestionDetail.builder()
                        .questionID(rs.getInt("questionID"))
                        .quizzID(rs.getInt("IDquizz"))
                        .content(rs.getString("content"))
                        .course(course)
                        .status(rs.getBoolean("Status"))
                        .lesson(lesson)
                        .quiz(quiz)
                        .build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

}
