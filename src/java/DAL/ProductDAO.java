/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.PC;
import Model.Product;
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
 * @author Zarius
 */
public class ProductDAO {

    public ArrayList<Product> getFourGamingPC() {
        ArrayList<Product> listGaming = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT p.* from PRODUCT as p WHERE Category_ID = 1 and Status = 1 ORDER BY p.Product_ID asc LIMIT 4;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setDescription(rs.getString(3));
                    p.setStatus(rs.getBoolean(4));
                    p.setQuantity(rs.getInt(5));
                    p.setProductStatusID(rs.getInt(6));
                    p.setCategoryID(rs.getInt(7));
                    listGaming.add(p);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listGaming;
    }

    public ArrayList<Product> getFourWorkStationPC() {
        ArrayList<Product> listWorkPC = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT p.* from PRODUCT as p WHERE Category_ID = 3 and Status = 1 ORDER BY p.Product_ID asc LIMIT 4;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setDescription(rs.getString(3));
                    p.setStatus(rs.getBoolean(4));
                    p.setQuantity(rs.getInt(5));
                    p.setProductStatusID(rs.getInt(6));
                    p.setCategoryID(rs.getInt(7));
                    listWorkPC.add(p);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listWorkPC;
    }

    public ArrayList<Product> getFourMiniPC() {
        ArrayList<Product> listMini = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT p.* from PRODUCT as p WHERE Category_ID = 2 and Status = 1 ORDER BY p.Product_ID asc LIMIT 4;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setDescription(rs.getString(3));
                    p.setStatus(rs.getBoolean(4));
                    p.setQuantity(rs.getInt(5));
                    p.setProductStatusID(rs.getInt(6));
                    p.setCategoryID(rs.getInt(7));
                    listMini.add(p);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listMini;
    }

    public Map<Integer, Integer> getOriginalPriceByID(ArrayList<Product> productList) {
        Map<Integer, Integer> listPrice = new HashMap<>();
        DBContext db = new DBContext();
        int productID;
        double productPrice;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT pc.product_ID, (m.price + c.price + r.price + v.price + s.price + p.price + ca.price) AS product_price\n"
                        + "FROM pc\n"
                        + "INNER JOIN mainboard m ON pc.Mainboard_ID = m.Mainboard_ID \n"
                        + "INNER JOIN `cpu` c ON pc.CPU_ID = c.CPU_ID\n"
                        + "INNER JOIN ram r ON pc.RAM_ID = r.RAM_ID\n"
                        + "INNER JOIN vga v ON pc.VGA_ID = v.VGA_ID\n"
                        + "INNER JOIN `storage` s ON pc.Storage_ID = s.Storage_ID\n"
                        + "INNER JOIN psu p ON pc.PSU_ID = p.PSU_ID\n"
                        + "INNER JOIN `case` ca ON pc.Case_ID = ca.Case_ID\n"
                        + "WHERE pc.product_ID = ?";
                PreparedStatement st = con.prepareStatement(sql);
                for (Product product : productList) {
                    st.setInt(1, product.getProductID());
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        productID = rs.getInt("product_ID");
                        productPrice = rs.getDouble("product_price");
                        listPrice.put(productID, (int) productPrice);
                    }
                    rs.close();
                }
                st.close();
                con.close();
            } else {
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listPrice;
    }

    public Map<Integer, Integer> getSalePriceByID(ArrayList<Product> productList, double salePercentage) {
        Map<Integer, Integer> listPrice = new HashMap<>();
        DBContext db = new DBContext();
        int productID;
        double productPrice, salePrice;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT pc.product_ID, (m.price + c.price + r.price + v.price + s.price + p.price + ca.price) AS product_price\n"
                        + "FROM pc\n"
                        + "INNER JOIN mainboard m ON pc.Mainboard_ID = m.Mainboard_ID \n"
                        + "INNER JOIN `cpu` c ON pc.CPU_ID = c.CPU_ID\n"
                        + "INNER JOIN ram r ON pc.RAM_ID = r.RAM_ID\n"
                        + "INNER JOIN vga v ON pc.VGA_ID = v.VGA_ID\n"
                        + "INNER JOIN `storage` s ON pc.Storage_ID = s.Storage_ID\n"
                        + "INNER JOIN psu p ON pc.PSU_ID = p.PSU_ID\n"
                        + "INNER JOIN `case` ca ON pc.Case_ID = ca.Case_ID\n"
                        + "WHERE pc.product_ID = ?";
                PreparedStatement st = con.prepareStatement(sql);
                for (Product product : productList) {
                    st.setInt(1, product.getProductID());
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        productID = rs.getInt("product_ID");
                        productPrice = rs.getDouble("product_price");
                        salePrice = productPrice * (1 - (salePercentage / 100));
                        listPrice.put(productID, (int) salePrice);
                    }
                    rs.close();
                }
                st.close();
                con.close();
            } else {
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listPrice;
    }

    public Product getProductByID(int productID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `product` WHERE Product_ID = " + productID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setDescription(rs.getString(3));
                    p.setStatus(rs.getBoolean(4));
                    p.setQuantity(rs.getInt(5));
                    p.setProductStatusID(rs.getInt(6));
                    p.setCategoryID(rs.getInt(7));
                    return p;
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

    public Integer getSalePriceByID(int productID, double salePercentage) {
        DBContext db = new DBContext();
        double productPrice, salePrice;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT pc.product_ID, (m.price + c.price + r.price + v.price + s.price + p.price + ca.price) AS product_price\n"
                        + "FROM pc\n"
                        + "INNER JOIN mainboard m ON pc.Mainboard_ID = m.Mainboard_ID \n"
                        + "INNER JOIN `cpu` c ON pc.CPU_ID = c.CPU_ID\n"
                        + "INNER JOIN ram r ON pc.RAM_ID = r.RAM_ID\n"
                        + "INNER JOIN vga v ON pc.VGA_ID = v.VGA_ID\n"
                        + "INNER JOIN `storage` s ON pc.Storage_ID = s.Storage_ID\n"
                        + "INNER JOIN psu p ON pc.PSU_ID = p.PSU_ID\n"
                        + "INNER JOIN `case` ca ON pc.Case_ID = ca.Case_ID\n"
                        + "WHERE pc.product_ID = ?";
                PreparedStatement st = con.prepareStatement(sql);
                st.setInt(1, productID);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    productPrice = rs.getDouble("product_price");
                    salePrice = productPrice * (1 - (salePercentage / 100));
                    return (int) salePrice;
                }
                rs.close();
                st.close();
                con.close();
            } else {
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Integer getOriginalPriceByID(int productID) {
        DBContext db = new DBContext();
        double productPrice;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT pc.product_ID, (m.price + c.price + r.price + v.price + s.price + p.price + ca.price) AS product_price\n"
                        + "FROM pc\n"
                        + "INNER JOIN mainboard m ON pc.Mainboard_ID = m.Mainboard_ID \n"
                        + "INNER JOIN `cpu` c ON pc.CPU_ID = c.CPU_ID\n"
                        + "INNER JOIN ram r ON pc.RAM_ID = r.RAM_ID\n"
                        + "INNER JOIN vga v ON pc.VGA_ID = v.VGA_ID\n"
                        + "INNER JOIN `storage` s ON pc.Storage_ID = s.Storage_ID\n"
                        + "INNER JOIN psu p ON pc.PSU_ID = p.PSU_ID\n"
                        + "INNER JOIN `case` ca ON pc.Case_ID = ca.Case_ID\n"
                        + "WHERE pc.product_ID = ?";
                PreparedStatement st = con.prepareStatement(sql);
                st.setInt(1, productID);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    productPrice = rs.getDouble("product_price");
                    return (int) productPrice;
                }
                rs.close();
                st.close();
                con.close();
            } else {
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Product> getRelatedPCExceptCurrent(int productID, int categoryID) {
        ArrayList<Product> listRand = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT p.*\n"
                        + "FROM product as p\n"
                        + "WHERE Status = 1 and p.Category_ID = " + categoryID + " and p.product_ID NOT IN (" + productID + ")\n"
                        + "ORDER BY RAND() LIMIT 4;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setDescription(rs.getString(3));
                    p.setStatus(rs.getBoolean(4));
                    p.setQuantity(rs.getInt(5));
                    p.setProductStatusID(rs.getInt(6));
                    p.setCategoryID(rs.getInt(7));
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

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM product";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Product product = new Product();
                    product.setProductID(rs.getInt(1));
                    product.setProductName(rs.getString(2));
                    product.setDescription(rs.getString(3));
                    product.setStatus(rs.getBoolean(4));
                    product.setQuantity(rs.getInt(5));
                    product.setProductStatusID(rs.getInt(6));
                    product.setCategoryID(rs.getInt(7));
                    products.add(product);
                }
                rs.close();
                ps.close();
                con.close();
            }
            return products;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
}
