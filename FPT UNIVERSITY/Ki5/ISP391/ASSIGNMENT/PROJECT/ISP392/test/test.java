
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
        DAO.UserDAO dao = new UserDAO();
        List<User> list = dao.getAllUser();
        System.out.println(list);

    }
}
