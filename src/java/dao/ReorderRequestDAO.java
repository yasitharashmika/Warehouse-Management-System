package dao;

import Utill.dbConnect;
import model.ReorderRequest;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ReorderRequestDAO {
    public List<ReorderRequest> getAllReorderRequests() {
        List<ReorderRequest> requests = new ArrayList<>();
        String sql = "SELECT * FROM reorder_requests";

        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                ReorderRequest request = new ReorderRequest();
                request.setId(rs.getInt("id"));
                request.setPartName(rs.getString("part_name"));
                request.setQuantity(rs.getInt("quantity"));
                request.setSupplierInfo(rs.getString("supplier_info"));
                request.setDeliveryDate(rs.getDate("delivery_date"));
                request.setUrgency(rs.getString("urgency"));
                requests.add(request);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return requests;
    }
    
    public boolean deleteReorderRequestById(int id) {
        boolean success = false;
        String sql = "DELETE FROM reorder_requests WHERE id = ?";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            success = stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
}
