/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Course;

/**
 *
 * @author ADMIN
 */
public class CourseDAO extends MyDAO{ 
    public List<Course> getAllCourse() {
        List<Course> t = new ArrayList<>();
        xSql = "select * FROM dbo.Course";
        Course x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Course.builder().course_id(rs.getInt(1))
                        .course_title(rs.getString(2))
                        .topic_id(rs.getInt(3))
                        .is_public(rs.getBoolean(4))
                        .duration(rs.getInt(5))
                        .description(rs.getString(6))
                        .rate(rs.getInt(7))
                        .img(rs.getString(8))
                        .createdby(rs.getString(9)).build();
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
