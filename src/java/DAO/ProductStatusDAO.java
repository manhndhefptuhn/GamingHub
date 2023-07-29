/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

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

    public ArrayList<ProductStatus> getProductStatus(){
        ArrayList<ProductStatus> productStatusList = new ArrayList<>();
        
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            
            if (con != null){
                Statement st = con.createStatement(); 
                String sql = "Select * from `product_status`"; 
                ResultSet rs = st.executeQuery(sql); 
                while (rs.next()){
                    ProductStatus productStatus = new ProductStatus(); 
                    productStatus.setProductStatusID(rs.getInt(1));
                    productStatus.setProductStatusName(rs.getString(2));
                    productStatus.setStatus(rs.getBoolean(3));
                    
                    productStatusList.add(productStatus); 
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return productStatusList; 
    }
}
