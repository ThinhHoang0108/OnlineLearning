
import DAO.CourseDAO;
import java.util.List;
import model.Course;

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
        CourseDAO dao = new CourseDAO();
        List<Course> list = dao.getAllCourse();
        System.out.println(list);
    }
}
