/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import model.Role;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class RoleDAO extends MyDAO {

    public Role getRoleByID(int roleID) {
        Role x = null;
        xSql = "SELECT * FROM dbo.Role R WHERE R.ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, roleID);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = Role.builder().role_id(rs.getInt(1)).role_name(rs.getString(2)).build();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public ArrayList<Role> getAllRole() {
        ArrayList<Role> r = new ArrayList<>();
        xSql = "SELECT * FROM dbo.[Role]";
        Role x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Role.builder().role_id(rs.getInt("ID"))
                        .role_name(rs.getString("Position"))
                        .build();
                r.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (r);
    }

}
