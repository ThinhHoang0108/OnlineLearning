/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Question;
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

}
