package dao;

import Utill.dbConnect;
import java.sql.*;
import model.User;

public class UserDAO {

    public boolean validateUser(User user) {
        try {
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            Connection con = dbConnect.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
