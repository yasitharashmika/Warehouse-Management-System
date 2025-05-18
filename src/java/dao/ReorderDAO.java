package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Reorder;
import Utill.dbConnect;

public class ReorderDAO {
    
    public void insertReorder(Reorder reorder) {
        String sql = "INSERT INTO reorder_requests (part_name, quantity, supplier_info, delivery_date, urgency) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = dbConnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, reorder.getPartName());
            stmt.setInt(2, reorder.getQuantity());
            stmt.setString(3, reorder.getSupplierInfo());
            stmt.setDate(4, java.sql.Date.valueOf(reorder.getDeliveryDate()));
            stmt.setString(5, reorder.getUrgency());

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Reorder> getAllReorders() {
        List<Reorder> list = new ArrayList<>();
        String sql = "SELECT * FROM reorder_requests";

        try (Connection con = dbConnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Reorder r = new Reorder();
                r.setId(rs.getInt("id"));
                r.setPartName(rs.getString("part_name"));
                r.setQuantity(rs.getInt("quantity"));
                r.setSupplierInfo(rs.getString("supplier_info"));
                r.setDeliveryDate(rs.getDate("delivery_date").toLocalDate());
                r.setUrgency(rs.getString("urgency"));
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
