/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.util.ArrayList;
import java.util.List;
import model.Topic;
import util.MyDAO;
/**
 *
 * @author vuxua
 */
public class TopicDAO extends MyDAO {
    public int getNumberTopic() {
        int t = 0;
        xSql = "SELECT COUNT(ID) as Total FROM [Topic]";
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
}
