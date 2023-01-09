/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Account;
import model.Order;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends MyDAO {

    public Account login(String username, String password) {
        Account x = null;
        xSql = "SELECT * FROM dbo.Accounts WHERE username = ? AND password = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = Account.builder().accId(rs.getInt(1))
                        .username(rs.getString(2))
                        .password(rs.getString(3))
                        .fullName(rs.getString(4))
                        .phone(rs.getString(5))
                        .status(rs.getInt(6))
                        .role(rs.getInt(7)).build();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public List<Account> getAllAccount() {
        List<Account> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.Accounts";
        Account x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Account.builder().accId(rs.getInt(1))
                        .username(rs.getString(2))
                        .password(rs.getString(3))
                        .fullName(rs.getString(4))
                        .phone(rs.getString(5))
                        .status(rs.getInt(6))
                        .role(rs.getInt(7)).build();
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public void deleteAccount(int accId) {
        xSql = "delete from dbo.Accounts where accId=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, accId);
            ps.executeUpdate();
            //con.commit();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Account getAccountInfoByUsername(String username) {
        Account x = null;
        xSql = "SELECT * FROM dbo.Accounts WHERE username = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = Account.builder().accId(rs.getInt(1))
                        .username(rs.getString(2))
                        .password(rs.getString(3))
                        .fullName(rs.getString(4))
                        .phone(rs.getString(5))
                        .status(rs.getInt(6))
                        .role(rs.getInt(7)).build();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public boolean insertAccount(String newUsername, String newPassword, String newFullname, String newPhone, int newStatus, int newRole) {
        boolean check = false;
        xSql = "INSERT INTO [dbo].[Accounts]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[fullName]\n"
                + "           ,[phone]\n"
                + "           ,[status]\n"
                + "           ,[role])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, newUsername);
            ps.setString(2, newPassword);
            ps.setString(3, newFullname);
            ps.setString(4, newPhone);
            ps.setInt(5, newStatus);
            ps.setInt(6, newRole);
            check = ps.executeUpdate() > 0 ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean changeAccount(String username, String name, String phone) {
        boolean check = false;
        xSql = "UPDATE Accounts SET fullname = ?, phone = ? WHERE username = ?";
        try {
            if (con != null) {
                ps = con.prepareStatement(xSql);
                ps.setString(1, name);
                ps.setString(2, phone);
                ps.setString(3, username);
                check = ps.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

}
