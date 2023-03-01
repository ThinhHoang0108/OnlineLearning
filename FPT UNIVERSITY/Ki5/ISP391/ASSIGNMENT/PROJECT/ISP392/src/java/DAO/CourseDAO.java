/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Course;
import util.MyDAO;

/**
 *
 * @author vuxua
 */
public class CourseDAO extends MyDAO {
    public List<Course> getAllcourse() {
        List<Course> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.[Course]";
        Course x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Course.builder().id(rs.getInt(1))
                        .thumnailURL(rs.getString(2))
                        .content(rs.getString(3))
                        .description(rs.getString(4))
                        .createDate(rs.getDate(5))
                        .IDcategory(rs.getInt(6))                  
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
     public List<Course> getRandomcourse() {
        List<Course> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.[Course]";
        Course x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Course.builder().id(rs.getInt("ID"))
                        .thumnailURL(rs.getString("Thumnail"))
                        .content(rs.getString("Content"))
                        .description(rs.getString("Description"))
                        .createDate(rs.getDate("DateCreated"))
                        .IDcategory(rs.getInt("IDcategory"))                  
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
    

    public Course getCourseById(int courseID) {
        Course x = null;
        xSql = "SELECT * FROM dbo.Course WHERE ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, courseID);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = Course.builder().id(rs.getInt("ID"))
                        .thumnailURL(rs.getString("Thumnail"))
                        .content(rs.getString("Content"))
                        .description(rs.getString("Description"))
                        .createDate(rs.getDate("DateCreated"))
                        .IDcategory(rs.getInt("IDcategory"))                  
                        .build();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }
    public void deleteCourse(String id) {
        xSql = "Delete FROM dbo.Course WHERE ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void insertCourse(String thumnail, String content, String description, String datecreate, String category) {
        String sql = "INSERT INTO [dbo].[Course]\n"
                + "           ([thumnail]\n"
                + "           ,[content]\n"               
                + "           ,[description]\n"
                + "           ,[datecreated]\n"
                + "           ,[IDcategory])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, content);
            ps.setString(2, thumnail);
            ps.setString(3, description);
            ps.setString(4, datecreate);
            ps.setString(5, category);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
