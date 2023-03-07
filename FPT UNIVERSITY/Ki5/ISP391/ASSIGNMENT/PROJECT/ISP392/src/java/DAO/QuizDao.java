/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
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
                QuizLevel quizlevel = new QuizLevel(rs.getInt("LevelID"), rs.getString("QuizLevelName"));
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

}
