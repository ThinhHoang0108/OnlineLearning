
import Base.Base;
import DAO.BlogDAO;
import DAO.RoleDAO;
import DAO.SubjectDAO;
import DAO.TopicDAO;
import DAO.UserDAO;
import java.util.List;
import model.Blog;
import model.Role;
import model.Subject;
import model.User;
import util.SendEmail;

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
        List<User> list = userdao.getAllUser();
        System.out.println(list);
//        int t = userdao.getNumberUser();
//        int t1 = topicdao.getNumberTopic();
//        Blog blog = dao.getBlogById(3);
//        List<Blog> list = dao.getAllBlog();
//        System.out.println(list);
//        System.out.println(t);
//            User admin = userdao.login("thinh123", "123123");
//            System.out.println(admin);
//        UserDAO d = new UserDAO();
//        List<User> listUsers = d.getAllUser();
//        String message = "Welcome to join";
//                 User acc = d.checkUserExist("thinh123");
//        int userid = userdao.getUserIdByEmail("hoangxthinh@gmail.com");
//        System.out.println(userid);
//        System.out.println(listUsers);
//        RoleDAO role = new RoleDAO();
//        Role role1 = role.getRoleByID(2);
//        System.out.println(role1);
//        SubjectDAO daosub = new SubjectDAO();
//        List<Subject> listSubject = daosub.getAllSubject();
//        System.out.println(listSubject);
//        List<Blog> listBlog = dao.getAllBlog();
//        System.out.println(listBlog);
    

    }
}
