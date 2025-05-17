package dao;

import Utill.dbConnect;
import java.sql.*;
import model.User;

public class UserDAO {

    public String getUserRole(String username, String password) {
    try {
        String query = "SELECT role FROM users WHERE username = ? AND password = ?";
        Connection con = dbConnect.getConnection();
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            return rs.getString("role");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}

    
    public void CreateUser(User user){
        try {
            
            String query = "INSERT INTO users (name, username, password, role) VALUES (?, ?, ?, ?)";
            Connection con = dbConnect.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getRole());
            stmt.executeUpdate();

            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
