/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Zarius
 */
public class Product {
    private int productID;
    private String productName;
    private String description;
    private boolean status;
    private int quantity;
    private int productStatusID;
    private int categoryID;

    public Product() {
    }

    public Product(int productID, String productName, String description, boolean status, int quantity, int productStatusID, int categoryID) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.status = status;
        this.quantity = quantity;
        this.productStatusID = productStatusID;
        this.categoryID = categoryID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProductStatusID() {
        return productStatusID;
    }

    public void setProductStatusID(int productStatusID) {
        this.productStatusID = productStatusID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }
    
}
