/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Glasses;

/**
 *
 * @author ADMIN
 */
public class GlassesDAO extends MyDAO {

    public List<Glasses> getAll() {
        List<Glasses> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.Glasses";
        Glasses x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Glasses.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .price(rs.getInt(3))
                        .imgPath(rs.getString(4))
                        .description(rs.getString(5))
                        .status(rs.getInt(6))
                        .categoryId(rs.getInt(7)).build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Glasses> getAllTop6New() {
        List<Glasses> t = new ArrayList<>();
        xSql = "SELECT TOP(6) pid, pName, price, imgPath, description, status, cateId FROM dbo.Glasses ORDER BY pid DESC";
        Glasses x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Glasses.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .price(rs.getInt(3))
                        .imgPath(rs.getString(4))
                        .description(rs.getString(5))
                        .status(rs.getInt(6))
                        .categoryId(rs.getInt(7)).build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Glasses> getGlassesByCateID(int categgoryID) {
        List<Glasses> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.Glasses WHERE cateId = ?";
        Glasses x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, categgoryID);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Glasses.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .price(rs.getInt(3))
                        .imgPath(rs.getString(4))
                        .description(rs.getString(5))
                        .status(rs.getInt(6))
                        .categoryId(rs.getInt(7)).build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public Glasses getGlassesById(int productId) {
        Glasses x = null;
        xSql = "SELECT * FROM dbo.Glasses WHERE pid = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = Glasses.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .price(rs.getInt(3))
                        .imgPath(rs.getString(4))
                        .description(rs.getString(5))
                        .status(rs.getInt(6))
                        .categoryId(rs.getInt(7)).build();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public List<Glasses> getGlassesWithPagging(int page, int PAGE_SIZE) {
        List<Glasses> t = new ArrayList<>();
        String xSql = "select *  from Glasses order by price ASC OFFSET (?-1)*? row fetch next ? rows only";
        Glasses x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Glasses.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .price(rs.getInt(3))
                        .imgPath(rs.getString(4))
                        .description(rs.getString(5))
                        .status(rs.getInt(6))
                        .categoryId(rs.getInt(7)).build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public int getTotalGlasses() {
        try {
            String sql = "select count(pid) from dbo.Glasses ";
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

    public List<Glasses> search(String keyword) {
        List<Glasses> t = new ArrayList<>();
        String xSql = "select *  from dbo.Glasses where pName LIKE '%" + keyword + "%'";
        Glasses x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Glasses.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .price(rs.getInt(3))
                        .imgPath(rs.getString(4))
                        .description(rs.getString(5))
                        .status(rs.getInt(6))
                        .categoryId(rs.getInt(7)).build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Glasses> getAllTop4Radnom() {
        List<Glasses> t = new ArrayList<>();
        xSql = "SELECT TOP(4) * FROM dbo.Glasses ORDER BY NEWID()";
        Glasses x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Glasses.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .price(rs.getInt(3))
                        .imgPath(rs.getString(4))
                        .description(rs.getString(5))
                        .status(rs.getInt(6))
                        .categoryId(rs.getInt(7)).build();
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
