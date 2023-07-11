/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Product_Images;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
}
