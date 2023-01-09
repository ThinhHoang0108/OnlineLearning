/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.Shipping;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends MyDAO {

    public int createReturnId(Order order) {
        xSql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([note]\n"
                + "           ,[status]\n"
                + "           ,[accId]\n"
                + "           ,[shippingId]\n"
                + "           ,[totalPrice])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql, Statement.RETURN_GENERATED_KEYS);//truy hoi hoac tra ve gia tri key cua doi tuong 
            ps.setString(1, order.getNote());
            ps.setInt(2, order.getStatus());
            ps.setInt(3, order.getAccId());
            ps.setInt(4, order.getShippingId());
            ps.setInt(5, order.getTotalPrice());
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public List<Order> getAllOrder() {
        List<Order> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.Orders";
        Order x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Order.builder().orderId(rs.getInt(1))
                        .orderDate(rs.getString(2))
                        .note(rs.getString(3))
                        .status(rs.getInt(4))
                        .accId(rs.getInt(5))
                        .totalPrice(rs.getInt(7))
                        .shippingId(rs.getInt(6))
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

    public void updateAccStatus(int orderId) {
        xSql = "UPDATE dbo.Orders SET status = 2 WHERE orderId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, orderId);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return;
    }

    public void updateCancStatus(int orderId) {
        xSql = "UPDATE dbo.Orders\n"
                + "SET status= 3\n"
                + "WHERE orderId=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, orderId);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return;
    }

    public List<Order> getOrderByID(int id) {
        List<Order> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.Orders WHERE accId = ?";
        Order x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Order.builder().orderId(rs.getInt(1))
                        .orderDate(rs.getString(2))
                        .note(rs.getString(3))
                        .status(rs.getInt(4))
                        .accId(rs.getInt(5))
                        .totalPrice(rs.getInt(7))
                        .shippingId(rs.getInt(6))
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
