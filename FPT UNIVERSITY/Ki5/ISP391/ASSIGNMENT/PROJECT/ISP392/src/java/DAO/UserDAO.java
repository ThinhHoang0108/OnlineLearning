/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.User;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends MyDAO {

    public List<User> getAllUser() {
        List<User> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.[User]";
        User x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = User.builder().uID(rs.getInt(1))
                        .name(rs.getString(2))
                        .dob(rs.getDate(3))
                        .phone(rs.getString(4))
                        .username(rs.getString(5))
                        .password(rs.getString(6)).build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }
    public void updateUser(String name, String phoneNumber, String passWord){
        
    }
    

    public int getNumberUser() {
        int t = 0;
        xSql = "SELECT COUNT(ID) as Total FROM [User]";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                t = rs.getInt("Total");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public User login(String username, String password) {
        User x = null;
        xSql = "SELECT * FROM dbo.[User] WHERE Username = ? AND Password = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = User.builder().uID(rs.getInt(1))
                        .name(rs.getString(2))
                        .dob(rs.getDate(3))
                        .phone(rs.getString(4))
                        .username(rs.getString(5))
                        .password(rs.getString(6)).build();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }
}
