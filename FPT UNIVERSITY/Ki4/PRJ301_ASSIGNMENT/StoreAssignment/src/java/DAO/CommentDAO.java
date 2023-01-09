/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Comment;

/**
 *
 * @author ADMIN
 */
public class CommentDAO extends MyDAO{

    public List<Comment> getALL() {
        List<Comment> t = new ArrayList<>();
        xSql = " SELECT b.fullName,a.createdDate,a.comment FROM dbo.Ratings a INNER JOIN dbo.Accounts b ON b.accId = a.accId";
        Comment x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = Comment.builder()
                        .rId(rs.getInt(1))
                        .pId(rs.getInt(2))
                        .comment(rs.getString(3))
                        .accId(rs.getInt(4))
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
