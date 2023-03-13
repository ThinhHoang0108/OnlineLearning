/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Course;
import model.Lesson;

import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class LessonDAO extends MyDAO {

    public List<Lesson> getAll(){
        List<Lesson> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.[Lesson]";
        Lesson x;
        try {
            ps = con.prepareStatement(xSql);
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
    
    public List<Lesson> getAlllessonByPage(int page, int PAGE_SIZE) {
        List<Lesson> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.Lesson ORDER BY ID ASC OFFSET (?-1)*? ROW FETCH NEXT ? ROWS ONLY";
        Lesson x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Lesson.builder()
                        .lessonID(rs.getInt("ID"))
                        .urlVideo(rs.getString("urlVideo"))
                        .courseID(rs.getInt("IDcourse"))
                        .content(rs.getString("Content"))                  
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
    
    public int getTotalLesson() {
        try {
            String sql = "SELECT COUNT(ID) FROM dbo.lesson";
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
    
    public void deleteLesson(String id) {
        xSql = "Delete FROM dbo.Lesson WHERE ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void insertLesson(String urlVideo, String content, String description, String courseID) {
        String sql = "INSERT INTO [dbo].[Lesson]\n"
                + "           ([urlVideo]\n"
                + "           ,[content]\n"
                + "           ,[description]\n"
                + "           ,[IDcourse])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, urlVideo);
            ps.setString(2, content);
            ps.setString(3, description);
            ps.setString(4, courseID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
//    
//    public void updateLesson(String urlVideo, String content, String description, String courseID, String id) {
//        String sql = "UPDATE [Lesson]\n"
//                + "SET       [urlVideo] = ?\n"
//                + ",[content] = ?\n"
//                + ",[description]= ?\n"
//                + ",[IDcourse]= ?\n"
//                + "WHERE ID = ?";
//        try {
//            ps = con.prepareStatement(sql);
//            ps.setString(1, urlVideo);
//            ps.setString(2, content);
//            ps.setString(3, description);
//            ps.setString(4, courseID);
//            ps.setString(5, id);
//            ps.executeUpdate();
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//    }
}
