package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {
    public Connection connection;
    public DBContext()
    {
        try {
            //Change the username password and url to connect your own database
            String username = "sa";
            String password = "sa";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=onlinelearn";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
