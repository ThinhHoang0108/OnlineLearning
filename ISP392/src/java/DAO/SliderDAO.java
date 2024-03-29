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
import model.Course;
import model.Slider;
import util.DBContext;
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
        String sql = "INSERT INTO [dbo].[Slide]\n"
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

    public void updateSlider(String slider_url, boolean status, String title, String content, String notes, int courseID, int slideID) {
        try {
            String sql = "UPDATE [dbo].[Slide]\n"
                    + "   SET [slider_url] = ?\n"
                    + "      ,[status] = ?\n"
                    + "      ,[title] = ?\n"
                    + "      ,[content] = ?\n"
                    + "      ,[notes] = ?\n"
                    + "      ,[courseID] = ?\n"
                    + " WHERE sliderId=?";
            PreparedStatement st = connection.prepareStatement(sql);

            ps = con.prepareStatement(sql);
            ps.setString(1, slider_url);
            ps.setBoolean(2, status);
            ps.setString(3, title);
            ps.setString(4, content);
            ps.setString(5, notes);
            ps.setInt(6, courseID);
            ps.setInt(7, slideID);
            ps.executeUpdate();
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public Slider getSliderById(int sliderId) {
        Slider x = null;
        xSql = "SELECT * FROM dbo.[slide] WHERE sliderId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, sliderId);
            rs = ps.executeQuery();
            if (rs.next()) {
                Course course = new CourseDAO().getCourseById(rs.getInt("courseID"));
                x = Slider.builder().sliderId(rs.getInt("sliderId"))
                        .slider_url(rs.getString("slider_url"))
                        .status(rs.getBoolean("status"))
                        .title(rs.getString("title"))
                        .content(rs.getString("content"))
                        .backlink(rs.getString("backlink"))
                        .notes(rs.getString("notes"))
                        .isShow(rs.getBoolean("isShow"))
                        .courseId(rs.getInt("courseID"))
                        .course(course)
                        .build();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public int getTotalSlider() {
        try {

            if (con != null) {
                String sql = "select distinct count(S.subjectId)\n"
                        + "from Slider AS Sl inner join Subject AS S\n"
                        + "on Sl.subId = S.subjectId";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public int getTotalSliderShow() {
        try {

            if (con != null) {
                String sql = "select distinct count(S.subjectId)\n"
                        + "from Slider AS Sl inner join Subject AS S\n"
                        + "on Sl.subId = S.subjectId and Sl.status = 1";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public int getTotalSlider(String keyword) {
        try {

            if (con != null) {
                String sql = "select distinct count(Sl.sliderId)\n"
                        + "from Slider AS Sl inner join Subject AS S\n"
                        + "on Sl.subId = S.subjectId\n"
                        + "and Sl.title like ? ";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, "%" + keyword + "%");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public int getfirstSliderId() {
        int t = 0;
        xSql = "select MIN(sliderId) from Slide";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                t = rs.getInt(1);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public void deleteSlider(int id) {
        xSql = "DELETE FROM [dbo].[Slide]\n"
                + "      WHERE sliderId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
