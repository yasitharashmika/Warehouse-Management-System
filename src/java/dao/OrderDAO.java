package dao;

import model.Order;
import java.sql.*;
import Utill.dbConnect;
import static Utill.dbConnect.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

public class OrderDAO {

    public boolean placeOrder(Order order) {
        boolean success = false;
        try {
            Connection con = dbConnect.getConnection();

            // 1. Insert the order with new columns: shipping_address, item_price, status
            String insertSql = "INSERT INTO orders (item_id, quantity, customer_name, shipping_address, item_price, status) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(insertSql);
            ps.setInt(1, order.getItemId());
            ps.setInt(2, order.getQuantity());
            ps.setString(3, order.getCustomerName());
            ps.setString(4, order.getShippingAddress());        // new
            ps.setDouble(5, order.getItemPrice());               // new
            ps.setString(6, order.getStatus());                   // new
            ps.executeUpdate();

            // 2. Update the stock count
            String updateStock = "UPDATE items SET stock_count = stock_count - ? WHERE id = ?";
            PreparedStatement ps2 = con.prepareStatement(updateStock);
            ps2.setInt(1, order.getQuantity());
            ps2.setInt(2, order.getItemId());
            ps2.executeUpdate();

            success = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
    
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        try {
            Connection con = dbConnect.getConnection();
            String sql = "SELECT o.id, o.item_id, o.quantity, o.order_date, o.customer_name, o.shipping_address, o.item_price, i.name AS item_name, o.status " +
                         "FROM orders o JOIN items i ON o.item_id = i.id";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setItemId(rs.getInt("item_id"));
                order.setItemName(rs.getString("item_name"));
                order.setQuantity(rs.getInt("quantity"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setCustomerName(rs.getString("customer_name"));
                order.setShippingAddress(rs.getString("shipping_address"));  // added
                order.setItemPrice(rs.getDouble("item_price"));              // added
                order.setStatus(rs.getString("status"));  // new: fetch status
                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    // New method: update order status by order id
    public boolean updateOrderStatus(int orderId, String newStatus) {
        boolean success = false;
        try {
            Connection con = dbConnect.getConnection();
            String sql = "UPDATE orders SET status = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newStatus);
            ps.setInt(2, orderId);
            int rows = ps.executeUpdate();
            success = (rows > 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
    
    public double getTotalRevenueOfShippedOrders() throws SQLException {
    double total = 0;
    String sql = "SELECT SUM(item_price * quantity) AS total_revenue FROM orders WHERE status = 'Shipped'";
    
    try (Connection conn = dbConnect.getConnection(); // use your connector
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {
        
        if (rs.next()) {
            total = rs.getDouble("total_revenue");
        }
    }
    return total;
}
        public int getTotalOrders() {
    int totalOrders = 0;
    String query = "SELECT COUNT(*) AS total FROM orders";
    try (Connection con = dbConnect.getConnection();
         PreparedStatement ps = con.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
            totalOrders = rs.getInt("total");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return totalOrders;
}

        public double getTodaysIncome() throws SQLException {
    double income = 0;
    String query = "SELECT SUM(item_price * quantity) AS todays_income FROM orders WHERE DATE(order_date) = CURDATE() AND status = 'Shipped'";

    
    try (Connection con = dbConnect.getConnection();
         PreparedStatement ps = con.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
            income = rs.getDouble("todays_income");
        }
    }
    
    return income;
}

    
    
}


