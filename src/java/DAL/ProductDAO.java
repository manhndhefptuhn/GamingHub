/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Product;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Zarius
 */
public class ProductDAO {

    public ArrayList<Product> getFourRandomIntelPC() {
        ArrayList<Product> listRand = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT p.*\n"
                        + "FROM product as p INNER JOIN pc as pc ON p.product_ID = pc.product_ID \n"
                        + "INNER JOIN `cpu` ON pc.cpu_ID = cpu.cpu_id\n"
                        + "WHERE cpu.cpu_Name like '%AMD%'\n"
                        + "ORDER BY RAND() asc LIMIT 4;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setStatus(rs.getBoolean(3));
                    p.setQuantity(rs.getInt(4));
                    listRand.add(p);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listRand;
    }
    
    public ArrayList<Product> getFourRandomAMDPC() {
        ArrayList<Product> listRand = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT p.*\n"
                        + "FROM product as p INNER JOIN pc as pc ON p.product_ID = pc.product_ID \n"
                        + "INNER JOIN `cpu` ON pc.cpu_ID = cpu.cpu_id\n"
                        + "WHERE cpu.cpu_Name like '%AMD%'\n"
                        + "ORDER BY RAND() asc LIMIT 4;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setStatus(rs.getBoolean(3));
                    p.setQuantity(rs.getInt(4));
                    listRand.add(p);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listRand;
    }
    
    
}
