/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Wishlist;
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
public class WishlistDAO {

    public int addToWishlist(int userID, int productID) {
        int row = 0;
        String sql = "INSERT INTO `wishlist` \n"
                + "values (?,?,?)";
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setNull(1, Types.INTEGER);
            st.setInt(2, userID);
            st.setInt(3, productID);
            row = st.executeUpdate();
            
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }

    public Integer getTotalWishlistProduct(int userID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT Count(*) as totalWishlistProduct From `wishlist` where User_ID = " + userID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    int totalWishlistProduct = rs.getInt("totalWishlistProduct");
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
    
    public Wishlist getWishlist(int userID, int productID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `wishlist` WHERE `User_ID` = " + userID + " and `Product_ID` = " + productID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    Wishlist wl = new Wishlist();
                    wl.setWishlistID(rs.getInt(1));
                    wl.setUserID(rs.getInt(2));
                    wl.setProductID(rs.getInt(3));
                    return wl;
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
    
    public ArrayList<Wishlist> getAllWishItemByUserID(int userID) {
        ArrayList<Wishlist> listWishList = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * from `wishlist` WHERE User_ID = " + userID + ";";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Wishlist wl = new Wishlist();
                    wl.setWishlistID(rs.getInt(1));
                    wl.setUserID(rs.getInt(2));
                    wl.setProductID(rs.getInt(3));
                    listWishList.add(wl);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listWishList;
    }
    
    public int removeWishlist(int userID, int productID) {
        int row = 0;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "DELETE FROM `wishlist` WHERE `User_ID` = " + userID + " and `Product_ID` = " + productID + ";";
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
}
