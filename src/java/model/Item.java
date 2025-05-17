package model;

public class Item {
    private int id;
    private String name;
    private int stockCount;
    private double price;

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getStockCount() { return stockCount; }
    public void setStockCount(int stockCount) { this.stockCount = stockCount; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}
