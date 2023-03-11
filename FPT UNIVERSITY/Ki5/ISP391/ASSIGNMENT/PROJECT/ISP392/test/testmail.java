
import Base.Base;
import static Base.Base.PASSWORD_EMAIL;
import static Base.Base.USERNAME_EMAIL;
import DAO.UserDAO;
import util.Mailer;
import util.SendEmail;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author ADMIN
 */
public class testmail {

    public static void main(String[] args) {
        SendEmail send1 = new SendEmail();
        String email = "thinhhxhe161617@fpt.edu.vn";
        String fullname = "Hoang Xuan Thinh";
        String user = "thinh123";
        String pass = "123123";
        String subject = "Verify your account";
        String message = "asdfasdfasfd";
        send1.sendMail("thinhhxhe161617@fpt.edu.vn", subject, message,USERNAME_EMAIL,PASSWORD_EMAIL);

    }
}
