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
public class BlogDAO extends MyDAO{
    public List<Blog> getAllBlog() {
        List<Blog> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.[Blog]";
        Blog x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Blog.builder().bID(rs.getInt(1))
                        .thumnailURL(rs.getString(2))
                        .content(rs.getString(3))
                        .description(rs.getString(4))
                        .uID(rs.getInt(5))
                        .tID(rs.getInt(6))
                        .cID(rs.getInt(7))
                        .createDate(rs.getDate(8))
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
