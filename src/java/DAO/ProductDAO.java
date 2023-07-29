/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

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
import java.sql.Types;
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
                        + "INNER JOIN `mainboard` m ON pc.Mainboard_ID = m.Mainboard_ID \n"
                        + "INNER JOIN `cpu` c ON pc.CPU_ID = c.CPU_ID\n"
                        + "INNER JOIN `ram` r ON pc.RAM_ID = r.RAM_ID\n"
                        + "INNER JOIN `vga` v ON pc.VGA_ID = v.VGA_ID\n"
                        + "INNER JOIN `storage` s ON pc.Storage_ID = s.Storage_ID\n"
                        + "INNER JOIN `psu` p ON pc.PSU_ID = p.PSU_ID\n"
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
                        + "INNER JOIN `mainboard` m ON pc.Mainboard_ID = m.Mainboard_ID \n"
                        + "INNER JOIN `cpu` c ON pc.CPU_ID = c.CPU_ID\n"
                        + "INNER JOIN `ram` r ON pc.RAM_ID = r.RAM_ID\n"
                        + "INNER JOIN `vga` v ON pc.VGA_ID = v.VGA_ID\n"
                        + "INNER JOIN `storage` s ON pc.Storage_ID = s.Storage_ID\n"
                        + "INNER JOIN `psu` p ON pc.PSU_ID = p.PSU_ID\n"
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
                        + "INNER JOIN `mainboard` m ON pc.Mainboard_ID = m.Mainboard_ID \n"
                        + "INNER JOIN `cpu` c ON pc.CPU_ID = c.CPU_ID\n"
                        + "INNER JOIN `ram` r ON pc.RAM_ID = r.RAM_ID\n"
                        + "INNER JOIN `vga` v ON pc.VGA_ID = v.VGA_ID\n"
                        + "INNER JOIN `storage` s ON pc.Storage_ID = s.Storage_ID\n"
                        + "INNER JOIN `psu` p ON pc.PSU_ID = p.PSU_ID\n"
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
                        + "INNER JOIN `mainboard` m ON pc.Mainboard_ID = m.Mainboard_ID \n"
                        + "INNER JOIN `cpu` c ON pc.CPU_ID = c.CPU_ID\n"
                        + "INNER JOIN `ram` r ON pc.RAM_ID = r.RAM_ID\n"
                        + "INNER JOIN `vga` v ON pc.VGA_ID = v.VGA_ID\n"
                        + "INNER JOIN `storage` s ON pc.Storage_ID = s.Storage_ID\n"
                        + "INNER JOIN `psu` p ON pc.PSU_ID = p.PSU_ID\n"
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

    public ArrayList<Product> getListProduct() {
        ArrayList<Product> products = new ArrayList<>();
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
                        + "INNER JOIN `pc` as pc ON p.Product_ID = pc.Product_ID\n"
                        + "INNER JOIN `cpu` as cpu ON pc.CPU_ID = cpu.CPU_ID\n"
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
                String sql = "select COUNT(*) from `product`";
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


    public int createProduct(Product product) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "INSERT INTO `product` \n"
                        + "VALUES (?,?,?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                ps.setNull(1, Types.INTEGER);
                ps.setString(2, product.getProductName());
                ps.setString(3, product.getDescription());
                ps.setBoolean(4, product.isStatus());
                ps.setInt(5, product.getQuantity());
                ps.setInt(6, product.getProductStatusID());
                ps.setDouble(7, product.getSalePercentage());
                ps.setInt(8, product.getCategoryID());
                ps.executeUpdate();
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public List<ProductStatus> getAllProductStatus() {
        List<ProductStatus> productStatusList = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection conn = db.getConnection();
            if (conn != null) {
                Statement stmt = conn.createStatement();
                String sql = "SELECT * FROM `product_status`";
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

    public Map<Integer, String> getCategoryNameByProductID(ArrayList<Product> products) {
        Map<Integer, String> mapCategoryName = new HashMap<>();
        DBContext db = new DBContext();
        int productID;
        String categoryName;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "Select p.Product_ID, c.Category_Name "
                        + "FROM `product` as p INNER JOIN `category` as c "
                        + "WHERE p.Category_ID = c.Category_ID and p.product_ID = ?";
                PreparedStatement st = con.prepareStatement(sql);
                for (Product product : products) {
                    st.setInt(1, product.getProductID());
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        productID = rs.getInt(1);
                        categoryName = rs.getString(2);
                        mapCategoryName.put(productID, categoryName);
                    }
                    rs.close();
                }
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return mapCategoryName;
    }

    public void updateProduct(Product product) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "UPDATE `product` "
                        + "SET `Product_Name` = ?, "
                        + "`Description` = ?, "
                        + "`Status` = ?, "
                        + "`Quantity` = ?, "
                        + "`Product_Status_ID` = ?, "
                        + "`SalePercentage` = ?, "
                        + "`Category_ID` = ? \n"
                        + "WHERE `Product_ID` = ?";
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

    public Map<Integer, Integer> getNumberOfProductByCategoryId(ArrayList<Category> categoryList) {
        Map<Integer, Integer> listNumberOfProduct = new HashMap<>();
        DBContext db = new DBContext();
        int categoryID, numberOfProduct;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "select c.category_id ,count(product_id) from "
                        + "`product` as p inner join `category` as c "
                        + "where p.category_ID = c.category_ID and c.category_ID = ?";
                PreparedStatement st = con.prepareStatement(sql);
                for (Category category : categoryList) {
                    st.setInt(1, category.getCategoryID());
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        categoryID = rs.getInt(1);
                        numberOfProduct = rs.getInt(2);
                        listNumberOfProduct.put(categoryID, numberOfProduct);
                    }
                    rs.close();
                }
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listNumberOfProduct;
    }
    
    public Map<Integer, Integer> getNumberOfProductByProductStatusId(ArrayList<ProductStatus> productStatusList) {
        Map<Integer, Integer> listNumberOfProductByStatus = new HashMap<>();
        DBContext db = new DBContext();
        int productStatusID, numberOfProduct;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "select ps.Product_Status_ID ,count(p.product_id) "
                        + "from `product` as p inner join `product_status` as ps "
                        + "where p.Product_Status_ID = ps.Product_Status_ID and ps.Product_Status_ID = ? ";
                PreparedStatement st = con.prepareStatement(sql);
                for (ProductStatus productStatus : productStatusList) {
                    st.setInt(1, productStatus.getProductStatusID());
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        productStatusID = rs.getInt(1);
                        numberOfProduct = rs.getInt(2);
                        listNumberOfProductByStatus.put(productStatusID, numberOfProduct);
                    }
                    rs.close();
                }
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listNumberOfProductByStatus;
    }
    
    public int updateStatusProduct(int id, int i) {
        int row = 0;
        try {
            String sql = "UPDATE `product`\n"
                    + "   SET `status` = ?\n"
                    + " WHERE `Product_ID` = ?";
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, i);
            st.setInt(2, id);
            row = st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }
    
}
