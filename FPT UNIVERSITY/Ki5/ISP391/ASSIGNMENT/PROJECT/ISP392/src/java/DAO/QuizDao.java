/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Quiz;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class QuizDao extends MyDAO{

    public List<Quiz> getAllQuizByLessonID(int lessonID) {
        List<Quiz> t = new ArrayList<>();
        String xSql = "SELECT * FROM dbo.Quizz WHERE IDLesson = ?";
        Quiz x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
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
                        .totalQuestion(rs.getInt(rs.getInt("totalQuestion")))
                        .userID(rs.getInt("userID"))
                        .questionID(rs.getInt("questionID"))
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
