/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.Role;
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

    public void updatePasswordByUsername(String password, String username) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE [dbo].[User]\n"
                    + "   SET [Password] = ?\n"
                    + " WHERE [Username] = ?");
            ps.setString(1, password);
            ps.setString(2, username);
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
                x = User.builder().userID(rs.getInt("ID"))
                        .name(rs.getString("Name"))
                        .dob(rs.getDate("Dateofbirth"))
                        .phone(rs.getString("PhoneNumber"))
                        .username(rs.getString("Username"))
                        .password(rs.getString("Password"))
                        .email(rs.getString("email"))
                        .roleID(rs.getInt("IDrole"))
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

    public User getUserByID(int userID) {
        User x = null;
        xSql = "SELECT * FROM dbo.[User] WHERE ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = User.builder().userID(rs.getInt("ID"))
                        .name(rs.getString("Name"))
                        .dob(rs.getDate("Dateofbirth"))
                        .phone(rs.getString("PhoneNumber"))
                        .username(rs.getString("Username"))
                        .password(rs.getString("Password"))
                        .email(rs.getString("email"))
                        .roleID(rs.getInt("IDrole"))
                        .build();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public void updateUser(String DOB, String phoneNumber, String name, String email, int UserId) {
        try {
            String sql = "update [dbo].[User] set  [Dateofbirth] = ?, [PhoneNumber]=?, [Name]=?, [email]=? where ID = ?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, DOB);
            st.setString(2, phoneNumber);
            st.setString(3, name);
            st.setString(4, email);
            st.setInt(5, UserId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertUser(String name, String dob, String phoneNumber, String username, String password, int role_id, String email) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([Name]\n"
                + "           ,[Dateofbirth]\n"
                + "           ,[PhoneNumber]\n"
                + "           ,[Username]\n"
                + "           ,[Password]\n"
                + "           ,[IDrole]\n"
                + "           ,[email])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {

            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, dob);
            ps.setString(3, phoneNumber);
            ps.setString(4, username);
            ps.setString(5, password);
            ps.setInt(6, role_id);
            ps.setString(7, email);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
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

    public int getNumberUserRegisterToday() {
        int t = 0;
        xSql = "WITH t AS (SELECT DISTINCT userId FROM dbo.Register WHERE DAY(regis_Date) = DAY(GETDATE()))\n"
                + "SELECT  COUNT(userId) FROM t";
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
                x = User.builder().userID(rs.getInt("ID"))
                        .name(rs.getString("Name"))
                        .dob(rs.getDate("Dateofbirth"))
                        .phone(rs.getString("PhoneNumber"))
                        .username(rs.getString("Username"))
                        .password(rs.getString("Password"))
                        .email(rs.getString("email"))
                        .roleID(rs.getInt("IDrole"))
                        .build();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public User checkUserExist(String user) {
        User x = null;
        xSql = "SELECT * FROM dbo.[User] WHERE Username = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, user);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = User.builder().userID(rs.getInt("ID"))
                        .name(rs.getString("Name"))
                        .dob(rs.getDate("Dateofbirth"))
                        .phone(rs.getString("PhoneNumber"))
                        .username(rs.getString("Username"))
                        .password(rs.getString("Password"))
                        .email(rs.getString("email"))
                        .roleID(rs.getInt("IDrole"))
                        .build();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public void registerUser(String user, String pass, String email, String phone) {
        xSql = "INSERT INTO [dbo].[User]\n"
                + "           ([PhoneNumber]\n"
                + "           ,[Username]\n"
                + "           ,[Password]\n"
                + "           ,[email]\n"
                + "           ,[idrole])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,2)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, phone);
            ps.setString(2, user);
            ps.setString(3, pass);
            ps.setString(4, email);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public int getUserIdByEmail(String email) {
        xSql = "SELECT ID FROM dbo.[User] WHERE email = ?";
        try {
            if (con != null) {
                ps = con.prepareStatement(xSql);
                ps.setString(1, email);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;

    }

    public List<User> getAllUserByPage(int page, int PAGE_SIZE) {
        List<User> t = new ArrayList<>();
        xSql = "SELECT * FROM dbo.[User] ORDER BY ID ASC OFFSET (?-1)*? ROW FETCH NEXT ? ROWS ONLY";
        User x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role role = new RoleDAO().getRoleByID(rs.getInt("IDrole"));
                x = User.builder().userID(rs.getInt("ID"))
                        .name(rs.getString("Name"))
                        .dob(rs.getDate("Dateofbirth"))
                        .phone(rs.getString("PhoneNumber"))
                        .username(rs.getString("Username"))
                        .password(rs.getString("Password"))
                        .email(rs.getString("email"))
                        .roleID(rs.getInt("IDrole"))
                        .role(role)
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
