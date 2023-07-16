/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.ProductStatus;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author AN515-57
 */
public class ProductStatusDAO {
//    public List<Category> getTotalCategory() {
//        List<Category> categoryList = new ArrayList<>();
//
//        try {
//            DBContext db = new DBContext();
//            Connection con = db.getConnection();
//
//            if (con != null) {
//                Statement st = con.createStatement();
//                String sql = "SELECT * FROM category";
//                ResultSet rs = st.executeQuery(sql);
//                while (rs.next()) {
//                    Category category = new Category();
//                    category.setCategoryID(rs.getInt("category_ID"));
//                    category.setCategoryName(rs.getString("category_Name"));
//                    category.setStatus(rs.getBoolean("status"));
//
//                    categoryList.add(category);
//                }
//            }
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//        }
//        return categoryList;
//    }
    
    public List<ProductStatus> getProductStatus(){
        List<ProductStatus> productStatusList = new ArrayList<>();
        
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            
            if (con != null){
                Statement st = con.createStatement(); 
                String sql = "Select * from product_status"; 
                ResultSet rs = st.executeQuery(sql); 
                while (rs.next()){
                    ProductStatus productStatus = new ProductStatus(); 
                    productStatus.setProductStatusID(rs.getInt("Product_Status_ID"));
                    productStatus.setProductStatusName(rs.getString("Product_Status_Name"));
                    productStatus.setStatus(rs.getBoolean("status"));
                    
                    productStatusList.add(productStatus); 
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return productStatusList; 
    }
    
    public static void main(String[] args) {
//        List<ProductStatus> productStatusList = getProductStatus(); 
//        
//        for (ProductStatus productStatus : productStatusList) {
//            System.out.println(productStatus.getProduct_status_name());
//        }
    }
}
