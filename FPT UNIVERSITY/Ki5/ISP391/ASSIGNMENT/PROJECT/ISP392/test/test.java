
import DAO.BlogDAO;
import DAO.TopicDAO;
import DAO.UserDAO;
import java.util.List;
import model.Blog;
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
        DAO.BlogDAO dao = new BlogDAO();
//        List<User> list = dao.getAllUser();
//        System.out.println(list);
        int t = userdao.getNumberUser();
        int t1 = topicdao.getNumberTopic();
        Blog blog = dao.getBlogById(3);
        List<Blog> list = dao.getAllBlog();
        System.out.println(list);
        System.out.println(t);
    }
}
