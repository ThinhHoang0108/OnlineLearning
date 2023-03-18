/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Course;
import model.Register;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class RegisterDAO extends MyDAO {

    public int checkRegistration(int courseID, int userID) {
        try {
            String sql = "SELECT * FROM dbo.Register WHERE courseId = ? AND userId = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, courseID);
            ps.setInt(2, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void insertCourseRegistration(int userID, int courseID) {
        xSql = "INSERT INTO [dbo].[Register]\n"
                + "           ([regis_Date]\n"
                + "           ,[status]\n"
                + "           ,[courseId]\n"
                + "           ,[userId])\n"
                + "     VALUES\n"
                + "           (?,1,?,?)";
        try {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            ZonedDateTime zdt = ZonedDateTime.now();
            String today = dtf.format(zdt);
            ps = con.prepareStatement(xSql);
            ps.setString(1, today);
            ps.setInt(2, courseID);
            ps.setInt(3, userID);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Register> getAllRegistration(int userID) {
        List<Register> t = new ArrayList<>();
        String xSql = "SELECT * FROM dbo.Register WHERE userId = ?";
        Register x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new CourseDAO().getCourseById(rs.getInt("courseId"));
                x = Register.builder()
                        .registerID(rs.getInt("regisId"))
                        .regis_Date(rs.getDate("regis_Date"))
                        .status(rs.getBoolean("status"))
                        .courseID(rs.getInt("courseId"))
                        .userID(rs.getInt("userId"))
                        .course(course)
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

    public int getTotalRegister(int userID) {
        try {
            String sql = "WITH t AS(SELECT ROW_NUMBER() over (order by r.regisId asc) AS regisId,r.regis_Date,r.status,r.userId,r.courseId FROM dbo.Register r WHERE r.userId = ?)\n"
                    + "SELECT COUNT(t.regisId) FROM t";
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

    public List<Register> getAllRegisterByPage(int page, int PAGE_SIZE, int userID) {
        List<Register> t = new ArrayList<>();
        String xSql = "SELECT ROW_NUMBER() over (order by r.regisId asc) AS regisId,r.regis_Date,r.status,r.userId,r.courseId FROM dbo.Register r"
                + " WHERE userId = ? ORDER BY regisId ASC OFFSET (?-1)*? ROW FETCH NEXT ? ROWS ONLY";
        Register x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userID);
            ps.setInt(2, page);
            ps.setInt(3, PAGE_SIZE);
            ps.setInt(4, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new CourseDAO().getCourseById(rs.getInt("courseId"));
                x = Register.builder()
                        .registerID(rs.getInt("regisId"))
                        .regis_Date(rs.getDate("regis_Date"))
                        .status(rs.getBoolean("status"))
                        .courseID(rs.getInt("courseId"))
                        .userID(rs.getInt("userId"))
                        .course(course)
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

    public void deleteRegistration(int courseID, int userID) {
        xSql = "DELETE FROM [dbo].[Register]\n"
                + "      WHERE courseId = ? AND userId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, courseID);
            ps.setInt(2, userID);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
