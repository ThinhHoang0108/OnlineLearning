/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Subject;
import util.MyDAO;

/**
 *
 * @author ADMIN
 */
public class SubjectDAO extends MyDAO {

    public List<Subject> getAllSubject() {
        List<Subject> t = new ArrayList<>();
        String xSql = "SELECT s.*, c.Name FROM dbo.Subject s  \n"
                + "INNER JOIN dbo.Category c ON c.ID = s.IDcategory ";
        Subject x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt(4), rs.getString(7));
                x = Subject.builder().
                        subjectID(rs.getInt(1))
                        .content(rs.getString(2))
                        .description(rs.getString(3))
                        .cateID(rs.getInt(4))
                        .courseID(rs.getInt(5))
                        .thumbnail(rs.getString(6))
                        .category(category)
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
