package Utill;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbConnect {
    public static Connection getConnection() {
        Connection con = null;

        String jdbcURL = "jdbc:mysql://localhost:3306/warehouse-management-system";
        String jdbcUsername = "root";
        String jdbcPassword = ""; 

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return con;
    }
}
