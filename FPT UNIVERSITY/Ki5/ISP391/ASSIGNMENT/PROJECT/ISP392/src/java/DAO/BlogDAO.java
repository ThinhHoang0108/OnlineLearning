/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Blog;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class BlogDAO extends MyDAO {

    public List<Blog> getAllBlog() {
        List<Blog> t = new ArrayList<>();
        String xSql = "SELECT * FROM dbo.[Blog]";
        Blog x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Blog.builder().id(rs.getInt(1))
                        .thumnailURL(rs.getString(2))
                        .content(rs.getString(3))
                        .description(rs.getString(4))
                        .uID(rs.getInt(6))
                        .cID(rs.getInt(7))
                        .createDate(rs.getDate(5))
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

    public Blog getBlogById(int blogID) {
        Blog x = null;
        xSql = "SELECT * FROM dbo.Blog WHERE ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, blogID);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = Blog.builder().id(rs.getInt(1))
                        .thumnailURL(rs.getString(2))
                        .content(rs.getString(3))
                        .description(rs.getString(4))
                        .uID(rs.getInt(6))
                        .cID(rs.getInt(7))
                        .createDate(rs.getDate(5))
                        .build();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public int getTotalBlog() {
        try {
            String sql = "SELECT COUNT(ID) FROM dbo.Blog";
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

    public List<Blog> getAllBlogByPage(int page, int PAGE_SIZE) {
        List<Blog> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.Blog ORDER BY ID ASC OFFSET (?-1)*? ROW FETCH NEXT ? ROWS ONLY";
        Blog x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Blog.builder().id(rs.getInt(1))
                        .thumnailURL(rs.getString(2))
                        .content(rs.getString(3))
                        .description(rs.getString(4))
                        .uID(rs.getInt(6))
                        .cID(rs.getInt(7))
                        .createDate(rs.getDate(5))
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

    public List<Blog> getAllBlogByPageKeyword(int page, int PAGE_SIZE, String keyword) {
        List<Blog> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.Blog WHERE content LIKE '%" + keyword + "%' ORDER BY ID ASC OFFSET (?-1)*? ROW FETCH NEXT ? ROWS ONLY";
        Blog x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Blog.builder().id(rs.getInt(1))
                        .thumnailURL(rs.getString(2))
                        .content(rs.getString(3))
                        .description(rs.getString(4))
                        .uID(rs.getInt(6))
                        .cID(rs.getInt(7))
                        .createDate(rs.getDate(5))
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

    public int getTotalBlogByKeyword(String keyword) {
        try {
            String sql = "SELECT COUNT(ID) FROM dbo.Blog WHERE content LIKE '%" + keyword + "%'";
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
}
