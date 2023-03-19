/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Comment;
import model.User;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class CommentDAO extends MyDAO {

    public List<Comment> getCommentByBlogID(int blogID) {
        List<Comment> t = new ArrayList<>();
        xSql = "SELECT c.*,u.Name,u.Dateofbirth, u.Username,u.PhoneNumber,u.Username,u.Password, u.email, u.IDrole FROM dbo.Comment c INNER JOIN dbo.[User] u ON u.ID = c.IDuser WHERE c.IDblog = ?";
        Comment x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, blogID);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("IDuser"), rs.getString("Name"), rs.getDate("Dateofbirth"), rs.getString("PhoneNumber"), rs.getString("Username"), rs.getString("Password"), rs.getString("email"), rs.getInt("IDrole"));
                x = Comment.builder()
                        .id(rs.getInt("ID"))
                        .blogID(rs.getInt("IDblog"))
                        .userID(rs.getInt("IDuser"))
                        .content(rs.getString("Content"))
                        .createDate(rs.getString("createDate"))
                        .user(user)
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
    public List<Comment> getAllCommentToday() {
        List<Comment> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.Comment WHERE DAY(createDate) = DAY(GETDATE())";
        Comment x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("IDuser"), rs.getString("Name"), rs.getDate("Dateofbirth"), rs.getString("PhoneNumber"), rs.getString("Username"), rs.getString("Password"), rs.getString("email"), rs.getInt("IDrole"));
                x = Comment.builder()
                        .id(rs.getInt("ID"))
                        .blogID(rs.getInt("IDblog"))
                        .userID(rs.getInt("IDuser"))
                        .content(rs.getString("Content"))
                        .createDate(rs.getString("createDate"))
                        .user(user)
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

    public int getTotalComment(int blogID) {
        try {
            String sql = "SELECT COUNT(ID) FROM dbo.Comment WHERE IDblog = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, blogID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void insertComment(int userID, int blogID, String content) {
        xSql = "INSERT INTO [dbo].[Comment]\n"
                + "           ([IDuser]\n"
                + "           ,[IDblog]\n"
                + "           ,[Content])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userID);
            ps.setInt(2, blogID);
            ps.setString(3, content);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public List<Comment> getAllCommentByPage(int blogID,int page, int PAGE_SIZE) {
        List<Comment> t = new ArrayList<>();
        xSql = "SELECT c.*,u.Name,u.Dateofbirth, u.Username,u.PhoneNumber,u.Username,u.Password, u.email, u.IDrole FROM dbo.Comment c INNER JOIN dbo.[User] u ON u.ID = c.IDuser WHERE c.IDblog = ? ORDER BY ID ASC OFFSET (?-1)*? ROW FETCH NEXT ? ROWS ONLY";
        Comment x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, blogID);
            ps.setInt(2, page);
            ps.setInt(3, PAGE_SIZE);
            ps.setInt(4, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("IDuser"), rs.getString("Name"), rs.getDate("Dateofbirth"), rs.getString("PhoneNumber"), rs.getString("Username"), rs.getString("Password"), rs.getString("email"), rs.getInt("IDrole"));
                x = Comment.builder()
                        .id(rs.getInt("ID"))
                        .blogID(rs.getInt("IDblog"))
                        .userID(rs.getInt("IDuser"))
                        .content(rs.getString("Content"))
                        .createDate(rs.getString("createDate"))
                        .user(user)
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
