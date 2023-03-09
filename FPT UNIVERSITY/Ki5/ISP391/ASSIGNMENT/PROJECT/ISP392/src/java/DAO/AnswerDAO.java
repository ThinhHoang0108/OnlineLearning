/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Answer;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class AnswerDAO extends MyDAO {

    public List<Answer> getAllAnswerByAnswerID(int questionID) {
        List<Answer> t = new ArrayList<>();
        String xSql = "SELECT * FROM dbo.Answer WHERE quesId = ?";
        Answer x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, questionID);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Answer.builder()
                        .answerID(rs.getInt("answerId"))
                        .questionID(rs.getInt("quesId"))
                        .content(rs.getString("content"))
                        .correct(rs.getBoolean("correct"))
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

    public int getAllCorrectAns(int questionID) {
        int t = 0;
        xSql = "SELECT COUNT(answerId) AS TotalCorrect FROM dbo.Answer WHERE quesId = ? AND correct = 1";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                t = rs.getInt("TotalCorrect");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public boolean checkAnswerIsCorrect(int answerID) {
        xSql = "SELECT * FROM dbo.Answer WHERE answerId = ? AND correct = 1";

        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, answerID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
