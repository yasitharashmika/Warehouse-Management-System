package dao;

import Utill.dbConnect;
import model.Message;
import java.sql.ResultSet;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MessageDAO {
    public static void sendMessage(Message message) {
        try (Connection conn = dbConnect.getConnection()) {
            String sql = "INSERT INTO messages (sender, recipient, subject, message, sent_at) VALUES (?, ?, ?, ?, NOW())";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, message.getSender());
            stmt.setString(2, message.getRecipient());
            stmt.setString(3, message.getSubject());
            stmt.setString(4, message.getMessage());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Message> getMessagesToManager() {
        List<Message> messages = new ArrayList<>();

        try (Connection conn = dbConnect.getConnection()) {
            String sql = "SELECT sender, subject, message, sent_at FROM messages WHERE recipient = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "manager");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Message msg = new Message();
                msg.setSender(rs.getString("sender"));
                msg.setSubject(rs.getString("subject"));
                msg.setMessage(rs.getString("message"));
                msg.setSentAt(rs.getTimestamp("sent_at"));
                messages.add(msg);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return messages;
    }
    
    public List<Message> getMessagesToStaff() {
    List<Message> messages = new ArrayList<>();

    try (Connection conn = dbConnect.getConnection()) {
        String sql = "SELECT sender, subject, message, sent_at FROM messages WHERE recipient = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, "staff");
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Message msg = new Message();
            msg.setSender(rs.getString("sender"));
            msg.setSubject(rs.getString("subject"));
            msg.setMessage(rs.getString("message"));
            msg.setSentAt(rs.getTimestamp("sent_at"));
            messages.add(msg);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return messages;
}

}
