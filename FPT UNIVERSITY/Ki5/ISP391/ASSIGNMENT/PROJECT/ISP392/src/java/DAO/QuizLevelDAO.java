/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.QuizLevel;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class QuizLevelDAO extends MyDAO{

    public List<QuizLevel> getAllQuizLevel () {
        List<QuizLevel> t = new ArrayList<>();
        String xSql = "SELECT * FROM dbo.QuizLevel";
        QuizLevel x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = QuizLevel.builder()
                        .quizLevelId(rs.getInt("QuizLevelID"))
                        .quizLevelName(rs.getString("QuizLevelName"))
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
