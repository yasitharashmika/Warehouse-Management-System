package dao;

import Utill.dbConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Order;

public class DashboardDAO {

    // Method to get count of pending orders
    public int getPendingOrdersCount() {
        int count = 0;

        try (Connection conn = dbConnect.getConnection()) {
            String sql = "SELECT COUNT(*) AS pending_count FROM orders WHERE status = 'Waiting Payment'";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt("pending_count");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
    public int getLowStockItemCount() {
    int count = 0;

    try (Connection conn = dbConnect.getConnection()) {
        String sql = "SELECT COUNT(*) AS low_stock_count FROM items WHERE stock_count < 15";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            count = rs.getInt("low_stock_count");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return count;
}
    
   public List<Order> getWaitingPaymentOrders() {
    List<Order> orders = new ArrayList<>();
    try (Connection conn = dbConnect.getConnection()) {
        String sql = "SELECT id, customer_name, item_price, quantity, status FROM orders WHERE status = 'Waiting Payment'";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Order order = new Order();
            order.setId(rs.getInt("id"));
            order.setCustomerName(rs.getString("customer_name"));
            order.setItemPrice(rs.getDouble("item_price"));  // ✅ now retrieved
            order.setQuantity(rs.getInt("quantity"));        // ✅ now retrieved
            order.setStatus(rs.getString("status"));
            orders.add(order);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return orders;
}



}
