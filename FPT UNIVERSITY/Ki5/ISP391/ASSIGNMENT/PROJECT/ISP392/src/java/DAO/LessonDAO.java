/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Lesson;

import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class LessonDAO extends MyDAO {

    public List<Lesson> getAllLesson(int courseID) {
        List<Lesson> t = new ArrayList<>();
        String xSql = "  SELECT * FROM Lesson WHERE IDcourse = ?";
        Lesson x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, courseID);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Lesson.builder()
                        .lessonID(rs.getInt("ID"))
                        .urlVideo(rs.getString("urlVideo"))
                        .content(rs.getString("Content"))
                        .courseID(rs.getInt("IDcourse"))
                        .description(rs.getString("Description"))
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

    public Lesson getLessonByLessonID(int lessonID) {
        Lesson x = null;
        xSql = "SELECT * FROM Lesson WHERE ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, lessonID);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = Lesson.builder()
                        .lessonID(rs.getInt("ID"))
                        .urlVideo(rs.getString("urlVideo"))
                        .content(rs.getString("Content"))
                        .courseID(rs.getInt("IDcourse"))
                        .description(rs.getString("Description"))
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
