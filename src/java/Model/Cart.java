/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Zarius
 */
public class Cart {
    private int cartID;
    private int productID;
    private int productPrice;
    private int quantity;
    private int totalCost;
    private int userID;

    public Cart(int cartID, int productID, int productPrice, int quantity, int totalCost, int userID) {
        this.cartID = cartID;
        this.productID = productID;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.totalCost = totalCost;
        this.userID = userID;
    }


    public Cart() {
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(int totalCost) {
        this.totalCost = totalCost;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
    
}
