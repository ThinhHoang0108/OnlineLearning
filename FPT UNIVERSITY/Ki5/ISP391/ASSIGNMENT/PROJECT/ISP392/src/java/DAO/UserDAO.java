/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends MyDAO {

    public void updatePassword(String email, String password) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE [dbo].[User]\n"
                    + "   SET [Password] = ?\n"
                    + " WHERE [Email] = ?");
            ps.setString(1, password);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean checkEmail(String email) {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM [User] WHERE Email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    public static void main(String[] args) {
        System.out.println(new UserDAO().checkEmail("lythhe161708@fpt.edu.vn"));
    }
    public String getPasswordOfEmail(String email) {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT [Password] FROM [User] WHERE Email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public List<User> getAllUser() {
        List<User> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.[User]";
        User x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = User.builder().userID(rs.getInt(1))
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
    public User getUserByID(int userID){
        User x = null;
        xSql = "SELECT * FROM dbo.User WHERE ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
         if(rs.next()){
              x = User.builder()
                        .userID(rs.getInt(1))
                        .name(rs.getString(2))
                        .dob(rs.getDate(3))
                        .phone(rs.getString(4))
                        .username(rs.getString(5))
                        .password(rs.getString(6))
                        .build();
         }
            
        } catch (Exception e) {
             e.printStackTrace();
        }
        return (x);
    }
    public void updateUser(String name, String phoneNumber, String passWord){
        try {
            String sql = "update [User] set name = ?, phoneNumber=?, passWord=? where ID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
          
            st.setString(1, name);
            st.setString(2, phoneNumber);
            st.setString(3, passWord);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }
    
    public void getUserbyID(){
        
    }
   public void insertUser(String name, String DOB, String phoneNumber, String userName, String passWord){
        
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
                x = User.builder().userID(rs.getInt(1))
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
