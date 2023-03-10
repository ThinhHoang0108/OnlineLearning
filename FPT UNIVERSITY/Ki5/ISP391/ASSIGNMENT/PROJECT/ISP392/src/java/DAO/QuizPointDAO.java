/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Course;
import model.QuizPointHistory;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class QuizPointDAO extends MyDAO {

    public int getTotalQuizHistory(int userID) {
        try {
            String sql = "WITH T AS(SELECT QP.attempt, QP.point, QP.taken_date, QP.pointPercent, QP.numQuesTrue, Qz.content AS \"contentQuiz\", Qz.totalQuestion, Qz.duration, Qz.ID AS \"quizID\",COUNT(Q.questionID) AS \"TotalQuestion1\", C.ID AS \"courseID\", C.Content FROM dbo.Quiz_POINT QP \n"
                    + "INNER JOIN dbo.Quizz Qz ON Qz.ID = QP.quizID \n"
                    + "INNER JOIN dbo.Question Q ON Q.IDquizz = Qz.ID  \n"
                    + "INNER JOIN dbo.Course C ON C.ID = Qz.courseID\n"
                    + "WHERE QP.userID = ?\n"
                    + "GROUP BY QP.attempt, QP.point, QP.taken_date, QP.pointPercent, QP.numQuesTrue, Qz.content, Qz.totalQuestion, Qz.duration, Qz.ID, C.ID, C.Content)\n"
                    + "SELECT COUNT(attempt) FROM T ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<QuizPointHistory> getListQuizPointHisByAccId(int page, int PAGE_SIZE, int userID) {
        List<QuizPointHistory> t = new ArrayList<>();
        xSql = "SELECT QP.attempt, QP.point, QP.taken_date, QP.pointPercent, QP.numQuesTrue, Qz.content, Qz.totalQuestion, Qz.duration, Qz.ID AS \"quizID\",COUNT(Q.questionID) AS \"TotalQuestion\", C.ID AS \"courseID\", C.Content, Qz.ratePass FROM dbo.Quiz_POINT QP \n"
                + "INNER JOIN dbo.Quizz Qz ON Qz.ID = QP.quizID \n"
                + "INNER JOIN dbo.Question Q ON Q.IDquizz = Qz.ID  \n"
                + "INNER JOIN dbo.Course C ON C.ID = Qz.courseID\n"
                + "WHERE QP.userID = ?\n"
                + "GROUP BY QP.attempt, QP.point, QP.taken_date, QP.pointPercent, QP.numQuesTrue, Qz.content, Qz.totalQuestion, Qz.duration, Qz.ID, C.ID, C.Content, Qz.ratePass ORDER BY QP.attempt ASC OFFSET (?-1)*? ROW FETCH NEXT ? ROWS ONLY";
        QuizPointHistory x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userID);
            ps.setInt(2, page);
            ps.setInt(3, PAGE_SIZE);
            ps.setInt(4, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = QuizPointHistory.builder()
                        .point(rs.getInt("point"))
                        .taken_date(rs.getString("taken_date"))
                        .quizContent(rs.getString("content"))
                        .duration(rs.getInt("duration"))
                        .totalQues(rs.getInt("totalQuestion"))
                        .pointPercent(rs.getFloat("pointPercent"))
                        .numQuesTrue(rs.getInt("numQuesTrue"))
                        .courseID(rs.getInt("courseID"))
                        .courseContent(rs.getString("Content"))
                        .numOfQues(rs.getInt("TotalQuestion"))
                        .quizID(rs.getInt("quizID"))
                        .attempt(rs.getInt("attempt"))
                        .ratePass(rs.getFloat("ratePass"))
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
