/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.AnswerDetail;
import model.Course;
import model.Quiz;
import model.QuizLevel;
import model.QuizPoint;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class QuizDao extends MyDAO {

    public List<Quiz> getAllQuizByLessonID(int lessonID) {
        List<Quiz> t = new ArrayList<>();
        String xSql = "SELECT a.*,b.QuizLevelName FROM dbo.Quizz a  INNER JOIN dbo.QuizLevel b ON b.QuizLevelID = a.LevelID WHERE IDLesson = ?";
        Quiz x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, lessonID);
            rs = ps.executeQuery();
            while (rs.next()) {
                QuizLevel quizlevel = new QuizLevel(rs.getInt("LevelID"), rs.getString("QuizLevelName"));
                x = Quiz.builder()
                        .quizID(rs.getInt("ID"))
                        .content(rs.getString("content"))
                        .levelID(rs.getInt("LevelID"))
                        .status(rs.getBoolean("status"))
                        .ratePass(rs.getFloat("ratePass"))
                        .lessonID(rs.getInt("IDLesson"))
                        .courseID(rs.getInt("courseID"))
                        .duration(rs.getInt("duration"))
                        .description(rs.getString("description"))
                        .attempt(rs.getInt("attempt"))
                        .totalQuestion(rs.getInt("totalQuestion"))
                        .userID(rs.getInt("userID"))
                        .questionID(rs.getInt("questionID"))
                        .quizlevel(quizlevel)
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

    public Quiz getQuizByID(int quizzID) {
        Quiz x = null;
        xSql = "SELECT a.*,b.QuizLevelName FROM dbo.Quizz a  INNER JOIN dbo.QuizLevel b ON b.QuizLevelID = a.LevelID WHERE a.ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, quizzID);
            rs = ps.executeQuery();
            if (rs.next()) {
                QuizLevel quizlevel = new QuizLevel(rs.getInt("LevelID"), rs.getString("QuizLevelName"));
                x = Quiz.builder()
                        .quizID(rs.getInt("ID"))
                        .content(rs.getString("content"))
                        .levelID(rs.getInt("LevelID"))
                        .status(rs.getBoolean("status"))
                        .ratePass(rs.getFloat("ratePass"))
                        .lessonID(rs.getInt("IDLesson"))
                        .courseID(rs.getInt("courseID"))
                        .duration(rs.getInt("duration"))
                        .description(rs.getString("description"))
                        .attempt(rs.getInt("attempt"))
                        .totalQuestion(rs.getInt("totalQuestion"))
                        .userID(rs.getInt("userID"))
                        .questionID(rs.getInt("questionID"))
                        .quizlevel(quizlevel)
                        .build();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public QuizPoint getQuizPointLast(int userID, int quizID) {
        QuizPoint x = null;
        xSql = "SELECT * FROM dbo.Quiz_POINT WHERE userID = ? AND quizID = ? ORDER BY attempt DESC";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userID);
            ps.setInt(2, quizID);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = QuizPoint.builder()
                        .id(rs.getInt("ID"))
                        .userID(rs.getInt("userID"))
                        .quizID(rs.getInt("quizID"))
                        .point(rs.getFloat("point"))
                        .attempt(rs.getInt("attempt"))
                        .percentPoint(rs.getFloat("pointPercent"))
                        .trueAnswer(rs.getFloat("numQuesTrue"))
                        .build();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);

    }

    public boolean checkDoQuizz(int userID, int quizID) {
        xSql = "SELECT * FROM dbo.Quiz_POINT WHERE userID = ? AND quizID = ?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userID);
            ps.setInt(2, quizID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void insertAnswerDetail(int questionID, int answerID, int userID, int quizID, int attempt) {
        xSql = "INSERT INTO [dbo].[AnswerDetail]\n"
                + "           ([questionId]\n"
                + "           ,[answerId]\n"
                + "           ,[userId]\n"
                + "           ,[quizId]\n"
                + "           ,[attempt])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, questionID);
            ps.setInt(2, answerID);
            ps.setInt(3, userID);
            ps.setInt(4, quizID);
            ps.setInt(5, attempt);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertQuizPoint(int userID, int quizID, float point, int attempt, float pointPercent, int numQuesTrue) {
        xSql = "INSERT INTO [dbo].[Quiz_POINT]\n"
                + "           ([userID]\n"
                + "           ,[quizID]\n"
                + "           ,[point]\n"
                + "           ,[taken_date]\n"
                + "           ,[pointPercent]\n"
                + "           ,[numQuesTrue]\n"
                + "           ,[attempt])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            ZonedDateTime zdt = ZonedDateTime.now();
            String today = dtf.format(zdt);
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userID);
            ps.setInt(2, quizID);
            ps.setDouble(3, Double.parseDouble("" + point));
            ps.setString(4, today);
            ps.setFloat(5, pointPercent);
            ps.setInt(6, numQuesTrue);
            ps.setInt(7, attempt);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean checkUserIsChoosen(int answerId, int quizId, int userid, int attempt) {
        xSql = "SELECT * FROM dbo.answerDetail WHERE answerId = ? AND quizId = ? AND userId = ? AND attempt = ?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, answerId);
            ps.setInt(2, quizId);
            ps.setInt(3, userid);
            ps.setInt(4, attempt);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getTotalQuiz() {
        try {
            String sql = "SELECT COUNT(ID) FROM dbo.Quizz";
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

    public List<Quiz> getAllQuiz() {
        List<Quiz> t = new ArrayList<>();
        xSql = "SELECT a.*,b.QuizLevelName,c.Thumnail, c.Content, c.Description, c.DateCreated, c.IDcategory FROM dbo.Quizz a  INNER JOIN dbo.QuizLevel b ON b.QuizLevelID = a.LevelID INNER JOIN dbo.Course c ON c.ID = a.courseID";
        Quiz x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                QuizLevel quizlevel = new QuizLevel(rs.getInt("LevelID"), rs.getString("QuizLevelName"));
                Course course = new Course(rs.getInt("courseID"), rs.getString("Thumnail"), rs.getString("Content"), rs.getString("Description"), rs.getDate("DateCreated"), rs.getInt("IDcategory"));
                x = Quiz.builder()
                        .quizID(rs.getInt("ID"))
                        .content(rs.getString("content"))
                        .levelID(rs.getInt("LevelID"))
                        .status(rs.getBoolean("status"))
                        .ratePass(rs.getFloat("ratePass"))
                        .lessonID(rs.getInt("IDLesson"))
                        .courseID(rs.getInt("courseID"))
                        .duration(rs.getInt("duration"))
                        .description(rs.getString("description"))
                        .attempt(rs.getInt("attempt"))
                        .totalQuestion(rs.getInt("totalQuestion"))
                        .userID(rs.getInt("userID"))
                        .questionID(rs.getInt("questionID"))
                        .quizlevel(quizlevel)
                        .course(course)
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

    public List<Quiz> getAllQuizByPage(int page, int PAGE_SIZE) {
        List<Quiz> t = new ArrayList<>();
        xSql = "SELECT a.*,b.QuizLevelName,c.Thumnail, c.Content, c.Description, c.DateCreated, c.IDcategory FROM dbo.Quizz a  INNER JOIN dbo.QuizLevel b ON b.QuizLevelID = a.LevelID INNER JOIN dbo.Course c ON c.ID = a.courseID ORDER BY a.ID ASC OFFSET (?-1)*? ROW FETCH NEXT ? ROWS ONLY";
        Quiz x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                QuizLevel quizlevel = new QuizLevel(rs.getInt("LevelID"), rs.getString("QuizLevelName"));
                Course course = new Course(rs.getInt("courseID"), rs.getString("Thumnail"), rs.getString("Content"), rs.getString("Description"), rs.getDate("DateCreated"), rs.getInt("IDcategory"));
                x = Quiz.builder()
                        .quizID(rs.getInt("ID"))
                        .content(rs.getString("content"))
                        .levelID(rs.getInt("LevelID"))
                        .status(rs.getBoolean("status"))
                        .ratePass(rs.getFloat("ratePass"))
                        .lessonID(rs.getInt("IDLesson"))
                        .courseID(rs.getInt("courseID"))
                        .duration(rs.getInt("duration"))
                        .description(rs.getString("description"))
                        .attempt(rs.getInt("attempt"))
                        .totalQuestion(rs.getInt("totalQuestion"))
                        .userID(rs.getInt("userID"))
                        .questionID(rs.getInt("questionID"))
                        .quizlevel(quizlevel)
                        .course(course)
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
            String sql = "SELECT DISTINCT COUNT(q.ID) FROM dbo.Quizz q INNER JOIN dbo.Lesson l ON q.IDLesson = l.ID WHERE q.content LIKE '%" + keyword +"%'";
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

    public int getTotalSearchByLevelID(String keyword, int levelID) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
