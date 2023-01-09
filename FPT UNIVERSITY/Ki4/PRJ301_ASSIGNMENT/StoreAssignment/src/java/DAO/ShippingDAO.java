/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.ResultSet;
import java.sql.Statement;
import model.Shipping;

/**
 *
 * @author ADMIN
 */
public class ShippingDAO extends MyDAO {

    public int createReturnId(Shipping shipping) {
        xSql = "INSERT INTO [dbo].[Shipping]\n"
                + "           ([name]\n"
                + "           ,[phone]\n"
                + "           ,[address])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            ps = con.prepareStatement(xSql, Statement.RETURN_GENERATED_KEYS);//truy hoi hoac tra ve gia tri key cua doi tuong 
            ps.setString(1, shipping.getName());
            ps.setString(2, shipping.getPhone());
            ps.setString(3, shipping.getAddress());
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
}
