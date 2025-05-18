package dao;

import model.Item;
import Utill.dbConnect;

import java.sql.*;
import java.util.*;

public class ItemDAO {

public boolean updateStock(int itemId, int quantity) {
    String sql = "UPDATE items SET stock_count = stock_count + ? WHERE id = ?";
    try (Connection conn = dbConnect.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, quantity);
        stmt.setInt(2, itemId);
        int rowsAffected = stmt.executeUpdate();
        return rowsAffected > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}


public List<Item> getAllItems() {
    List<Item> list = new ArrayList<>();
    String sql = "SELECT * FROM items";
    try (Connection conn = dbConnect.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            Item item = new Item();
            item.setId(rs.getInt("id"));
            item.setName(rs.getString("name"));
            item.setStockCount(rs.getInt("stock_count"));
            item.setPrice(rs.getDouble("price"));
            list.add(item);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}

public int getLowStockItemCount() throws SQLException {
    int count = 0;
    String sql = "SELECT COUNT(*) AS low_stock_count FROM items WHERE stock_count < 15";
    
    try (Connection con = dbConnect.getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
            count = rs.getInt("low_stock_count");
        }
    }
    
    return count;
}

public List<Item> getLowStockItems() {
    List<Item> lowStockItems = new ArrayList<>();
    String sql = "SELECT id, name, stock_count FROM items WHERE stock_count < 15";

    try (Connection con = dbConnect.getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        
        while (rs.next()) {
            Item item = new Item();
            item.setId(rs.getInt("id"));
            item.setName(rs.getString("name"));
            item.setStockCount(rs.getInt("stock_count"));
            lowStockItems.add(item);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return lowStockItems;
}




}




