/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Category;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class CategoryDAO extends MyDAO {

    public List<Category> getAllCategory() {
        List<Category> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.[Category]";
        Category x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Category.builder().id(rs.getInt(1))
                        .name(rs.getString(2))
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

    public Category getCategoryById(int categoryID) {
        Category x = null;
        xSql = "SELECT * FROM dbo.Category WHERE ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, categoryID);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = Category.builder().id(rs.getInt(1))
                        .name(rs.getString(2))
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
