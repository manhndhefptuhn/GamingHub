/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Zarius
 */
public class CategoryDAO {
    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> listCategory = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * from `category` WHERE Status = 1;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Category c = new Category();
                    c.setCategoryID(rs.getInt(1));
                    c.setCategoryName(rs.getString(2));
                    c.setStatus(rs.getBoolean(3));
                    listCategory.add(c);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listCategory;
    }
    
    public ArrayList<Category> getTotalCategory() {
        ArrayList<Category> categoryList = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `category`";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Category c = new Category();
                    c.setCategoryID(rs.getInt(1));
                    c.setCategoryName(rs.getString(2));
                    c.setStatus(rs.getBoolean(3));
                    categoryList.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return categoryList;
    }
    
    public int createCategory(Category createCategory){
        int row = 0; 
        
        String sql = "INSERT INTO `category` VALUES (?,?,?)";
        
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setNull(1, Types.INTEGER);
            st.setString(2, createCategory.getCategoryName());
            st.setBoolean(3, createCategory.isStatus());
            row = st.executeUpdate();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }
    
    public Category getCategoryViaID(int categoryID){
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null){
                Statement st = con.createStatement();
                String sql = "select * from category where category_ID = " + categoryID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()){
                    Category category = new Category(); 
                    category.setCategoryID(rs.getInt(1));
                    category.setCategoryName(rs.getString(2));
                    category.setStatus(rs.getBoolean(3));
                    return category;
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        
        return null; 
    }
    
    public static int editCategoryInfo(Category category){
        int row = 0; 
        try {
            String sql = "UPDATE category SET category_name = ?, status = ? WHERE category_ID = ?"; 
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, category.getCategoryName());
            ps.setBoolean(2, category.isStatus());
            ps.setInt(3, category.getCategoryID());
            row = ps.executeUpdate();
        } catch (Exception ex){
            System.out.println(ex.getMessage());
            ex.printStackTrace();
            row = -1; 
        }
        return row; 
    }
}
