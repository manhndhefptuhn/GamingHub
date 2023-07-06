/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Feedback;
import Model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Zarius
 */
public class FeedbackDAO {

    public ArrayList<Feedback> getProductFeedback(int productID) {
        ArrayList<Feedback> listFeedback = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `feedback` WHERE product_ID = " + productID + " and Status = 1;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Feedback f = new Feedback();
                    f.setFeedbackID(rs.getInt(1));
                    f.setUserID(rs.getInt(2));
                    f.setProductID(rs.getInt(3));
                    f.setCreatedDate(rs.getString(4));
                    f.setContent(rs.getString(5));
                    f.setImage(rs.getString(6));
                    f.setRating(rs.getDouble(7));
                    f.setStatus(rs.getBoolean(8));
                    listFeedback.add(f);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listFeedback;
    }

    public Map<Integer, Integer> getStarByProductID(ArrayList<Product> productList) {
        Map<Integer, Integer> listStar = new HashMap<>();
        DBContext db = new DBContext();
        int productID;
        double rating;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT Product_ID, AVG(Rating) AS average_rating FROM feedback WHERE Product_ID = ?;";
                PreparedStatement st = con.prepareStatement(sql);
                for (Product product : productList) {
                    st.setInt(1, product.getProductID());
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        productID = rs.getInt("Product_ID");
                        rating = rs.getDouble("average_rating");
                        listStar.put(productID, (int) rating);
                    }
                    rs.close();
                }
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listStar;
    }

    public Integer getStarByProductID(int productID) {
        DBContext db = new DBContext();
        double rating;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT Product_ID, AVG(Rating) AS average_rating FROM feedback WHERE Product_ID = ?;";
                PreparedStatement st = con.prepareStatement(sql);
                st.setInt(1, productID);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    rating = rs.getDouble("average_rating");
                    return (int)rating;
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
    
    public Integer getTotalFeedback(int productID) {
        DBContext db = new DBContext();
        int totalFeedback;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT Count(*) as totalFeedback FROM feedback WHERE Product_ID = ?;";
                PreparedStatement st = con.prepareStatement(sql);
                st.setInt(1, productID);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    totalFeedback = rs.getInt("totalFeedback");
                    return totalFeedback;
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

}
