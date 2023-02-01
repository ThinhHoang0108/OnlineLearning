
import DAO.TopicDAO;
import DAO.UserDAO;
import java.util.List;
import model.User;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author ADMIN
 */
public class test {

    public static void main(String[] args) {
        DAO.UserDAO userdao = new UserDAO();
        DAO.TopicDAO topicdao = new TopicDAO();
//        List<User> list = dao.getAllUser();
//        System.out.println(list);
        int t = userdao.getNumberUser();
        int t1=topicdao.getNumberTopic();
        System.out.println(t1);
    }
}
