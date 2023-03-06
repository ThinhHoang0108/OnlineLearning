/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Slider;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class SliderDAO extends MyDAO {
      public List<Slider> getAllSlider() {
        List<Slider> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.[Slide]";
        Slider x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Slider.builder().sliderId(rs.getInt("sliderid"))
                        .slider_url(rs.getString("slider_url"))
                        .status(rs.getBoolean("status"))
                        .title(rs.getString("title"))
                        .content(rs.getString("content"))
                        .backlink(rs.getString("backlink"))
                        .notes(rs.getString("notes"))
                        .isShow(rs.getBoolean("isShow"))
                        .courseId(rs.getInt("courseID"))
                        .build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return (t);
    }
      
       public void insertSlider(String title, boolean status, String image, String content, String notes, int courseId) {
        String sql = "INSERT INTO [SWP391_Project_Test].[dbo].[Slider]\n"
                + "           ([slider_url]\n"
                + "           ,[status]\n"
                + "           ,[title]\n"
                + "           ,[content]\n"
                + "           ,[notes]\n"
                + "           ,[courseId])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {            
                ps = con.prepareStatement(sql);
                ps.setString(1, image);
                ps.setBoolean(2, status);
                ps.setString(3, title);
                ps.setString(4, content);
                ps.setString(5, notes);
                ps.setInt(6, courseId);
                ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
