/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author ADMIN
 */
public class CategoryDAO extends MyDAO {

    public List<Category> getAll() {
        List<Category> t = new ArrayList<>();
        xSql = "select * FROM dbo.Categories";
        Category x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Category.builder().cateId(rs.getInt(1)).cateName(rs.getString(2)).build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public Category getCategoryByID(int cateID) {
        Category x = null;
        xSql = "select * FROM dbo.Categories WHERE cateId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, cateID);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = Category.builder().cateId(rs.getInt(1)).cateName(rs.getString(2)).build();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public boolean insertNewCategory(String cateName) {
        boolean check = false;
        xSql = "INSERT INTO [dbo].[Categories]\n"
                + "           ([cateName])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, cateName);
            check = ps.executeUpdate() > 0 ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateCategoryInfo(int cateId, String cateName) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
