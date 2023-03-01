
import Base.Base;
import DAO.UserDAO;
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
//        SendEmail send = new SendEmail();
//        String email = "thinhhxhe161617@fpt.edu.vn";
//        String fullname = "Hoang Xuan Thinh";
//        String user = "thinh123";
//        String pass = "123123";
//        String subject = "Verify your account";
//        String message = "<!DOCTYPE html>\n"
//                + "<html lang=\"en\">\n"
//                + "<head></head>\n"
//                + "<body style=\"color:#000;\">\n"
//                + "    <h3>Welcome to join </h3>\n"
//                + "    <p>Please click here to verify your account</p>\n"
//                + "    \n"
//                + "    <form id=\"myForm\" method=\"POST\" action=" + Base.LINK_VERIFY + ">\n"
//                + "        <input type=\"hidden\" value=" + email + " id=\"email\" name=\"email\">\n"
//                + "        <input type=\"hidden\" value=" + fullname + " id=\"name\" name=\"fullname\">\n"
//                + "        <input type=\"text\" value=" + user + " id=\"username\" name=\"username\">\n"
//                + "        <input type=\"text\" value=" + pass + " id=\"password\" name=\"password\">\n"
//                + "        <input type=\"submit\" value=\"Verify\" \n"
//                + "            style=\"padding: 10px 15px;color: #fff;background-color: rgb(0, 149, 255);border-radius: 10px;border:none\"\n"
//                + "        >\n"
//                + "    </form>\n"
//                + "\n"
//                + "    <h4>Thank you very much</h4>\n"
//                + "</body>\n"
//                + "</html>";
//        SendEmail.sendMail("thinhhxhe161617@fpt.edu.vn", subject, message, Base.USERNAME_EMAIL, Base.PASSWORD_EMAIL);
        UserDAO dao = new UserDAO();
        dao.registerUser("thinh123", "123123", "thinhhxhe161617@fpt.edu.vn", "0865511924");

    }
}
