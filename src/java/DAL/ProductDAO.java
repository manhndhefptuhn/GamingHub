/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Cart;
import Model.Product;
import Model.Wishlist;
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
                String sql = "SELECT p.*, AVG(f.Rating) AS highest_rating\n"
                        + "                   FROM PRODUCT AS p\n"
                        + "                   LEFT JOIN feedback AS f ON p.Product_ID = f.Product_ID\n"
                        + "                   WHERE p.Category_ID = 1 AND p.Status = 1\n"
                        + "                   GROUP BY p.Product_ID\n"
                        + "                   ORDER BY highest_rating DESC, p.Product_ID ASC\n"
                        + "                   LIMIT 4;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setDescription(rs.getString(3));
                    p.setStatus(rs.getBoolean(4));
                    p.setQuantity(rs.getInt(5));
                    p.setProductStatusID(rs.getInt(6));
                    p.setSalePercentage(rs.getDouble(7));
                    p.setCategoryID(rs.getInt(8));
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
                String sql = "SELECT p.*, AVG(f.Rating) AS highest_rating\n"
                        + "                   FROM PRODUCT AS p\n"
                        + "                   LEFT JOIN feedback AS f ON p.Product_ID = f.Product_ID\n"
                        + "                   WHERE p.Category_ID = 3 AND p.Status = 1\n"
                        + "                   GROUP BY p.Product_ID\n"
                        + "                   ORDER BY highest_rating DESC, p.Product_ID ASC\n"
                        + "                   LIMIT 4;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setDescription(rs.getString(3));
                    p.setStatus(rs.getBoolean(4));
                    p.setQuantity(rs.getInt(5));
                    p.setProductStatusID(rs.getInt(6));
                    p.setSalePercentage(rs.getDouble(7));
                    p.setCategoryID(rs.getInt(8));
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
                String sql = "SELECT p.*, AVG(f.Rating) AS highest_rating\n"
                        + "                   FROM PRODUCT AS p\n"
                        + "                   LEFT JOIN feedback AS f ON p.Product_ID = f.Product_ID\n"
                        + "                   WHERE p.Category_ID = 2 AND p.Status = 1\n"
                        + "                   GROUP BY p.Product_ID\n"
                        + "                   ORDER BY highest_rating DESC, p.Product_ID ASC\n"
                        + "                   LIMIT 4;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setDescription(rs.getString(3));
                    p.setStatus(rs.getBoolean(4));
                    p.setQuantity(rs.getInt(5));
                    p.setProductStatusID(rs.getInt(6));
                    p.setSalePercentage(rs.getDouble(7));
                    p.setCategoryID(rs.getInt(8));
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

    public Map<Integer, Integer> getSalePriceByID(ArrayList<Product> productList) {
        Map<Integer, Integer> listPrice = new HashMap<>();
        DBContext db = new DBContext();
        int productID;
        double productPrice, salePercentage, salePrice;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT pro.SalePercentage, pc.product_ID, (m.price + c.price + r.price + v.price + s.price + p.price + ca.price) AS product_price\n"
                        + "FROM pc\n"
                        + "INNER JOIN mainboard m ON pc.Mainboard_ID = m.Mainboard_ID \n"
                        + "INNER JOIN `cpu` c ON pc.CPU_ID = c.CPU_ID\n"
                        + "INNER JOIN ram r ON pc.RAM_ID = r.RAM_ID\n"
                        + "INNER JOIN vga v ON pc.VGA_ID = v.VGA_ID\n"
                        + "INNER JOIN `storage` s ON pc.Storage_ID = s.Storage_ID\n"
                        + "INNER JOIN psu p ON pc.PSU_ID = p.PSU_ID\n"
                        + "INNER JOIN `case` ca ON pc.Case_ID = ca.Case_ID\n"
                        + "INNER JOIN `product` pro ON pc.Product_ID = pro.Product_ID\n"
                        + "WHERE pc.product_ID = ?";
                PreparedStatement st = con.prepareStatement(sql);
                for (Product product : productList) {
                    st.setInt(1, product.getProductID());
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        productID = rs.getInt("product_ID");
                        productPrice = rs.getDouble("product_price");
                        salePercentage = rs.getDouble("SalePercentage");
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
                    p.setSalePercentage(rs.getDouble(7));
                    p.setCategoryID(rs.getInt(8));
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

    public Integer getSalePriceByID(int productID) {
        DBContext db = new DBContext();
        double productPrice, salePrice, salePercentage;
        try ( Connection con = db.getConnection()) {
            if (con != null) {
                String sql = "SELECT pro.SalePercentage, pc.product_ID, (m.price + c.price + r.price + v.price + s.price + p.price + ca.price) AS product_price\n"
                        + "FROM pc\n"
                        + "INNER JOIN mainboard m ON pc.Mainboard_ID = m.Mainboard_ID \n"
                        + "INNER JOIN `cpu` c ON pc.CPU_ID = c.CPU_ID\n"
                        + "INNER JOIN ram r ON pc.RAM_ID = r.RAM_ID\n"
                        + "INNER JOIN vga v ON pc.VGA_ID = v.VGA_ID\n"
                        + "INNER JOIN `storage` s ON pc.Storage_ID = s.Storage_ID\n"
                        + "INNER JOIN psu p ON pc.PSU_ID = p.PSU_ID\n"
                        + "INNER JOIN `case` ca ON pc.Case_ID = ca.Case_ID\n"
                        + "INNER JOIN `product` pro ON pc.Product_ID = pro.Product_ID\n"
                        + "WHERE pc.product_ID = ?";
                PreparedStatement st = con.prepareStatement(sql);
                st.setInt(1, productID);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    productPrice = rs.getDouble("product_price");
                    salePercentage = rs.getDouble("SalePercentage");
                    salePrice = productPrice * (1 - (salePercentage / 100));
                    return (int) salePrice;
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

    public Integer getOriginalPriceByID(int productID) {
        DBContext db = new DBContext();
        double productPrice;
        try ( Connection con = db.getConnection()) {
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
                    p.setSalePercentage(rs.getDouble(7));
                    p.setCategoryID(rs.getInt(8));
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

    public List<Product> getListProduct() {
        List<Product> products = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM product";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setDescription(rs.getString(3));
                    p.setStatus(rs.getBoolean(4));
                    p.setQuantity(rs.getInt(5));
                    p.setProductStatusID(rs.getInt(6));
                    p.setSalePercentage(rs.getDouble(7));
                    p.setCategoryID(rs.getInt(8));
                    products.add(p);
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

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> listProduct = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT p.* from PRODUCT as p WHERE Status = 1 ORDER BY p.product_id";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setDescription(rs.getString(3));
                    p.setStatus(rs.getBoolean(4));
                    p.setQuantity(rs.getInt(5));
                    p.setProductStatusID(rs.getInt(6));
                    p.setSalePercentage(rs.getDouble(7));
                    p.setCategoryID(rs.getInt(8));
                    listProduct.add(p);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listProduct;
    }

    public ArrayList<Product> getAllProductByCategory(int categoryID) {
        ArrayList<Product> listProduct = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT p.* from PRODUCT as p WHERE p.Status = 1 and p.Category_ID = " + categoryID + " ORDER BY p.product_id;";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setDescription(rs.getString(3));
                    p.setStatus(rs.getBoolean(4));
                    p.setQuantity(rs.getInt(5));
                    p.setProductStatusID(rs.getInt(6));
                    p.setSalePercentage(rs.getDouble(7));
                    p.setCategoryID(rs.getInt(8));
                    listProduct.add(p);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listProduct;
    }

    public ArrayList<Product> getAllProductByCategoryAndCpuName(int categoryID, String cpuName) {
        ArrayList<Product> listProduct = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT p.* from PRODUCT as p \n"
                        + "INNER JOIN pc as pc ON p.Product_ID = pc.Product_ID\n"
                        + "INNER JOIN cpu as cpu ON pc.CPU_ID = cpu.CPU_ID\n"
                        + "WHERE p.Status = 1 and p.Category_ID = " + categoryID + " and cpu.CPU_Name like '%" + cpuName + "%'  ORDER BY p.product_id;";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setDescription(rs.getString(3));
                    p.setStatus(rs.getBoolean(4));
                    p.setQuantity(rs.getInt(5));
                    p.setProductStatusID(rs.getInt(6));
                    p.setSalePercentage(rs.getDouble(7));
                    p.setCategoryID(rs.getInt(8));
                    listProduct.add(p);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listProduct;
    }

    public ArrayList<Product> getAllProductByCategoryAndProductStatus(int categoryID, int productStatus) {
        ArrayList<Product> listProduct = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT p.* from PRODUCT as p "
                        + "WHERE p.Status = 1 and p.Category_ID = " + categoryID + " and p.Product_Status_ID = " + productStatus + " "
                        + "ORDER BY p.product_id;";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt(1));
                    p.setProductName(rs.getString(2));
                    p.setDescription(rs.getString(3));
                    p.setStatus(rs.getBoolean(4));
                    p.setQuantity(rs.getInt(5));
                    p.setProductStatusID(rs.getInt(6));
                    p.setSalePercentage(rs.getDouble(7));
                    p.setCategoryID(rs.getInt(8));
                    listProduct.add(p);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listProduct;
    }

    public Map<Integer, String> getWishlistProductNameByProductID(ArrayList<Wishlist> listWishList) {
        Map<Integer, String> listName = new HashMap<>();
        DBContext db = new DBContext();
        String productName;
        int productID;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "Select * FROM `product` WHERE Product_ID = ?;";
                PreparedStatement st = con.prepareStatement(sql);
                for (Wishlist wishlist : listWishList) {
                    st.setInt(1, wishlist.getProductID());
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        productID = rs.getInt("Product_ID");
                        productName = rs.getString("Product_Name");
                        listName.put(productID, productName);
                    }
                    rs.close();
                }
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listName;
    }

    public Map<Integer, String> getCartProductNameByProductID(ArrayList<Cart> listCart) {
        Map<Integer, String> listName = new HashMap<>();
        DBContext db = new DBContext();
        String productName;
        int productID;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "Select * FROM `product` WHERE Product_ID = ?;";
                PreparedStatement st = con.prepareStatement(sql);
                for (Cart cart : listCart) {
                    st.setInt(1, cart.getProductID());
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        productID = rs.getInt("Product_ID");
                        productName = rs.getString("Product_Name");
                        listName.put(productID, productName);
                    }
                    rs.close();
                }
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listName;
    }

    public Map<Integer, Integer> getProductStatusByProductID(ArrayList<Wishlist> listWishList) {
        Map<Integer, Integer> listName = new HashMap<>();
        DBContext db = new DBContext();
        int productID, productStatus;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "Select * FROM `product` WHERE Product_ID = ?;";
                PreparedStatement st = con.prepareStatement(sql);
                for (Wishlist wishlist : listWishList) {
                    st.setInt(1, wishlist.getProductID());
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        productID = rs.getInt("Product_ID");
                        productStatus = rs.getInt("Product_Status_ID");
                        listName.put(productID, productStatus);
                    }
                    rs.close();
                }
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listName;
    }

    public Map<Integer, Integer> getProductQuantityByID(ArrayList<Cart> listCart) {
        Map<Integer, Integer> listQuantity = new HashMap<>();
        DBContext db = new DBContext();
        int productID, quantity;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "Select * FROM `product` WHERE Product_ID = ?;";
                PreparedStatement st = con.prepareStatement(sql);
                for (Cart cart : listCart) {
                    st.setInt(1, cart.getProductID());
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        productID = rs.getInt("Product_ID");
                        quantity = rs.getInt("Quantity");
                        listQuantity.put(productID, quantity);
                    }
                    rs.close();
                }
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listQuantity;
    }
}
