/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;

/**
 *
 * @author Zarius
 */
public class CartDAO {
    public Integer getTotalCartProduct(int userID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT Count(*) as totalCartProduct From `Cart` where User_ID = " + userID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    int totalWishlistProduct = rs.getInt("totalCartProduct");
                    return totalWishlistProduct;

                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
     public int addToCart(int userID, int productID, int productPrice, int quantity, int totalCost) {
        int row = 0;
        String sql = "INSERT INTO `cart` \n"
                + "values (?,?,?,?,?,?)";
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setNull(1, Types.INTEGER);
            st.setInt(2, productID);
            st.setInt(3, productPrice);
            st.setInt(4, quantity);
            st.setInt(5, totalCost);
            st.setInt(6, userID);
            row = st.executeUpdate();
            
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }
     
     public Cart getCart(int userID, int productID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `cart` WHERE `User_ID` = " + userID + " and `Product_ID` = " + productID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    Cart c = new Cart();
                    c.setCartID(rs.getInt(1));
                    c.setProductID(rs.getInt(2));
                    c.setProductPrice(rs.getInt(3));
                    c.setQuantity(rs.getInt(4));
                    c.setTotalCost(rs.getInt(5));
                    c.setUserID(rs.getInt(6));
                    return c;
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
     
     public int removeCart(int userID, int productID) {
        int row = 0;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "DELETE FROM `cart` WHERE `User_ID` = " + userID + " and `Product_ID` = " + productID + ";";
                row = st.executeUpdate(sql);
                st.close();
                con.close();
            }
        } catch (Exception e) {
            row = -1;
            System.out.println(e.getMessage());
        }
        return row;
    }
     
     public int updateCartIfExist(int price, int quantity, int totalCost, int userID, int productID){
        int row = 0;
        try {
            String sql = "UPDATE `cart`\n"
                    + "   SET \n"
                    + "      `Product_Price` = ?,\n"
                    + "      `Quantity` = ?,\n"
                    + "      `Total_Cost` = ?\n"
                    + " WHERE `User_ID` = ? and `Product_ID` = ?;";
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, price);
            st.setInt(2, quantity);
            st.setInt(3, totalCost);
            st.setInt(4, userID);
            st.setInt(5, productID);
            row = st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }
     
    public Integer getQuantityOfProduct(int userID, int productID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `Cart` where User_ID = " + userID + " and `Product_ID` = " + productID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    int currentQuantity = rs.getInt("Quantity");
                    return currentQuantity;

                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public ArrayList<Cart> getAllCartItemByUserID(int userID) {
        ArrayList<Cart> listCart = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * from `cart` WHERE User_ID = " + userID + ";";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Cart c = new Cart();
                    c.setCartID(rs.getInt(1));
                    c.setProductID(rs.getInt(2));
                    c.setProductPrice(rs.getInt(3));
                    c.setQuantity(rs.getInt(4));
                    c.setTotalCost(rs.getInt(5));
                    c.setUserID(rs.getInt(6));
                    listCart.add(c);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listCart;
    }
}
