/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Subject;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class SubjectDAO extends MyDAO{
    public List<Subject> getAllSubject() {
        List<Subject> t = new ArrayList<>();
        String xSql = "SELECT DISTINCT S.* FROM dbo.[Subject] AS S";
        Subject x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Subject.builder().
                        subjectID(rs.getInt(1))
                        .content(rs.getString(2))
                        .description(rs.getString(3))
                        .cateID(rs.getInt(4))
                        .courseID(rs.getInt(5))
                        .thumbnail(rs.getString(6))
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
