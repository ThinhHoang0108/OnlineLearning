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

    public Course getCourseById(int blogID) {
        Course x = null;
        xSql = "SELECT * FROM dbo.Course WHERE ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, blogID);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = Course.builder().id(rs.getInt(1))
                        .thumnailURL(rs.getString(2))
                        .content(rs.getString(3))
                        .description(rs.getString(4))
                        .createDate(rs.getDate(5))
                        .IDcategory(rs.getInt(6))                  
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