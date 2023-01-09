/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Statement;
import java.util.Map;
import model.Cart;

/**
 *
 * @author ADMIN
 */
public class OrderDetailDAO extends MyDAO {

    public void saveCart(int orderId, Map<Integer, Cart> carts) {
        xSql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([orderId]\n"
                + "           ,[pId]\n"
                + "           ,[quantity]\n"
                + "           ,[price])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, orderId);
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer productId = entry.getKey();
                Cart cart = entry.getValue();
                ps.setInt(2, productId);
                ps.setInt(3, cart.getQuantity());
                ps.setInt(4, cart.getGlasses().getPrice());
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
