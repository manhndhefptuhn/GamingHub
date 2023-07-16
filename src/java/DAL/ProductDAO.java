/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Cart;
import Model.Category;
import Model.Product;
import Model.ProductStatus;
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

    public ArrayList<Product> getFourPCByCategoryID(int CategoryID) {
        ArrayList<Product> listFourPC = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT p.*, AVG(f.Rating) AS highest_rating\n"
                        + "                   FROM `product` AS p\n"
                        + "                   LEFT JOIN `feedback` AS f ON p.Product_ID = f.Product_ID\n"
                        + "                   WHERE p.Category_ID = " + CategoryID + " AND p.Status = 1\n"
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
                    listFourPC.add(p);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listFourPC;
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
                        + "FROM `pc`\n"
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
                        + "FROM `pc`\n"
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
                        + "FROM `product` as p\n"
                        + "WHERE p.status = 1 and p.Category_ID = " + categoryID + " and p.product_ID NOT IN (" + productID + ")\n"
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
                String sql = "SELECT * FROM `product`";
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
                String sql = "SELECT p.* from `product` as p WHERE Status = 1 ORDER BY p.product_id";
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
                String sql = "SELECT p.* from `product` as p WHERE p.Status = 1 and p.Category_ID = " + categoryID + " ORDER BY p.product_id;";
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
                String sql = "SELECT p.* from `product` as p \n"
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
                String sql = "SELECT p.* from `product` as p "
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

    public int getTotalNumberOfProduct() {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();

            if (con != null) {
                Statement st = con.createStatement();
//                String sql = "select COUNT(*) from Product";
                String sql = "select COUNT(*) from Product where product_Id >= 1 AND product_Id <= 10";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return 0;
    }

    public int getQuantityOfProductByProductName(int id) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();

            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select quantity from Product where product_id = " + id;
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return 0;
    }

    public List<Product> getAllProduct1() {
        List<Product> productList = new ArrayList<>();

        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();

            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM product WHERE product_Id >= 1 AND product_Id <= 10;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Product product = new Product();
                    product.setProductID(rs.getInt("product_Id"));
                    product.setProductName(rs.getString("product_Name"));
                    product.setStatus(rs.getBoolean("status"));
                    product.setQuantity(rs.getInt("quantity"));

                    productList.add(product);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return productList;
    }

    public void createProduct(Product product) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "INSERT INTO product (product_name, description, status, quantity, product_status_id, salePercentage, category_id) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, product.getProductName());
                ps.setString(2, product.getDescription());
                ps.setBoolean(3, product.isStatus());
                ps.setInt(4, product.getQuantity());
                ps.setInt(5, product.getProductStatusID());
                ps.setDouble(6, product.getSalePercentage());
                ps.setInt(7, product.getCategoryID());
                ps.executeUpdate();
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int generatedProductId = rs.getInt(1);
                    product.setProductID(generatedProductId);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<ProductStatus> getAllProductStatus() {
        List<ProductStatus> productStatusList = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection conn = db.getConnection();
            if (conn != null) {
                Statement stmt = conn.createStatement();
                String sql = "SELECT * FROM product_status";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    ProductStatus productStatus = new ProductStatus();
                    productStatus.setProductStatusID(rs.getInt(1));
                    productStatus.setProductStatusName(rs.getString(2));
                    productStatus.setStatus(rs.getBoolean(3));
                    productStatusList.add(productStatus);
                }
                rs.close();
                stmt.close();
                conn.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return productStatusList;
    }

    public String getProductStatusNameByID(int productStatusID) {
        String productStatusName = null;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT product_status_name FROM product_status WHERE product_status_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, productStatusID);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    productStatusName = rs.getString(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return productStatusName;
    }

    public String getCategoryNameByID(int categoryID) {
        String categoryName = null;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT category_name FROM category WHERE category_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, categoryID);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    categoryName = rs.getString(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return categoryName;
    }

    public int getProductStatusIDByName(String productStatusName) {
        int productStatusID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT product_status_id FROM product_status WHERE product_status_name = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, productStatusName);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    productStatusID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return productStatusID;
    }

    public int getCategoryIDByName(String categoryName) {
        int categoryID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT category_id FROM category WHERE category_name = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, categoryName);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    categoryID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return categoryID;
    }
    
    public ProductStatus getProductStatusByID(int id) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM product_status WHERE product_status_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    ProductStatus p = new ProductStatus();
                    p.setProductStatusID(rs.getInt(1));
                    p.setProductStatusName(rs.getString(2));
                    p.setStatus(rs.getBoolean(3));
                    rs.close();
                    ps.close();
                    con.close();
                    return p;
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public static void updateProduct(Product product) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "UPDATE product SET Product_Name = ?, Description = ?, Status = ?, Quantity = ?, Product_Status_ID = ?, SalePercentage = ?, Category_ID = ? WHERE Product_ID = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, product.getProductName());
                ps.setString(2, product.getDescription());
                ps.setBoolean(3, product.isStatus());
                ps.setInt(4, product.getQuantity());
                ps.setInt(5, product.getProductStatusID());
                ps.setDouble(6, product.getSalePercentage());
                ps.setInt(7, product.getCategoryID());
                ps.setInt(8, product.getProductID());
                ps.executeUpdate();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public int getProductStatusIDByProductID(int id) {
        int productStatusID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT product_status_id FROM product WHERE product_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    productStatusID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return productStatusID;
    }
    
    public int getCategoryIDByProductID(int id) {
        int categoryID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT category_id FROM product WHERE product_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    categoryID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return categoryID;
    }
    
    public Category getCategoryByID(int id) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM category WHERE category_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    Category c = new Category();
                    c.setCategoryID(rs.getInt(1));
                    c.setCategoryName(rs.getString(2));
                    c.setStatus(rs.getBoolean(3));
                    rs.close();
                    ps.close();
                    con.close();
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public int getCPUIDByProductID(int id) {
        int CPUID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT cpu_id FROM pc WHERE product_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    CPUID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return CPUID;
    }
    
    public int getCaseIDByProductID(int id) {
        int CaseID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT case_id FROM pc WHERE product_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    CaseID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return CaseID;
    }
    
    public int getMainboardIDByProductID(int id) {
        int MainboardID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT mainboard_id FROM pc WHERE product_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    MainboardID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return MainboardID;
    }
    
    public int getPSUIDByProductID(int id) {
        int PSUID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT psu_id FROM pc WHERE product_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    PSUID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return PSUID;
    }
    
    public int getRAMIDByProductID(int id) {
        int RAMID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT ram_id FROM pc WHERE product_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    RAMID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return RAMID;
    }
    
    public int getStorageIDByProductID(int id) {
        int StorageID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT storage_id FROM pc WHERE product_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    StorageID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return StorageID;
    }
    
    public int getVGAIDByProductID(int id) {
        int VGAID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT vga_id FROM pc WHERE product_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    VGAID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return VGAID;
    }
    
    public int getNumberOfProductByCategoryId(int catetoryId){
        try{
            DBContext db = new DBContext(); 
            Connection con = db.getConnection();
            
            if (con != null){
                Statement st = con.createStatement();
                String sql = "select count(product_id) from product where category_id = " + catetoryId;
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return 0; 
    }
    
    public int getNumberOfProductByProductStatusId(int productStatusId){
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();

            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select COUNT(*) from Product where Product_Status_ID = " + productStatusId;
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return 0;
    }
}
