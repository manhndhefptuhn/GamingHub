/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.Product_Images;
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
public class ProductImagesDAO {
    public ArrayList<Product_Images> getListImageOfProductByID(int productID) {
        ArrayList<Product_Images> listImageOfProduct = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `product_images` WHERE Product_ID = " + productID + ";";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product_Images primg = new Product_Images();
                    primg.setProductImagesID(rs.getInt(1));
                    primg.setProductID(rs.getInt(2));
                    primg.setImages(rs.getString(3));
                    listImageOfProduct.add(primg);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listImageOfProduct;
    }
    
    public int insertImages(Product_Images pdimg) {
        int row = 0;
        String sql = "INSERT INTO `product_images` \n"
                + "values (?,?,?)";
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setNull(1, Types.INTEGER);
            st.setInt(2, pdimg.getProductID());
            st.setString(3, pdimg.getImages());
            row = st.executeUpdate();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }
    
    public int removeImage(int productID, String image) {
        int row = 0;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "DELETE FROM `product_images` WHERE `Product_ID` = " + productID + " AND `images` = '" + image + "';";
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
