/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Cart;
import Model.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Zarius
 */
public class OrderDetailDAO {

    public void addCartToOrder(ArrayList<Cart> listCart, int orderID) {

        try {
            for (Cart cart : listCart) {
                String sql = "INSERT INTO `order_detail` \n"
                        + "values (?,?,?,?,?,?)";
                DBContext db = new DBContext();
                Connection con = db.getConnection();
                PreparedStatement st = con.prepareStatement(sql);
                st.setNull(1, Types.INTEGER);
                st.setInt(2, orderID);
                st.setInt(3, cart.getProductID());
                st.setInt(4, cart.getProductPrice());
                st.setInt(5, cart.getQuantity());
                st.setInt(6, cart.getTotalCost());
                st.executeUpdate();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<OrderDetail> getDetailAllOrder(int orderId) {
        ArrayList<OrderDetail> listOrderDetail = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * from `order_detail` where `Order_ID` = " + orderId + ";";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    OrderDetail orddt = new OrderDetail();
                    orddt.setOrderDetailID(rs.getInt(1));
                    orddt.setOrderID(rs.getInt(2));
                    orddt.setProductID(rs.getInt(3));
                    orddt.setProductPrice(rs.getInt(4));
                    orddt.setQuantity(rs.getInt(5));
                    orddt.setTotalCost(rs.getInt(6));
                    listOrderDetail.add(orddt);
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listOrderDetail;
    }

    public Map<Integer, String> getCartProductNameByProductID(ArrayList<OrderDetail> listOrderDetail) {
        Map<Integer, String> listName = new HashMap<>();
        DBContext db = new DBContext();
        String productName;
        int productID;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "Select * FROM `product` WHERE Product_ID = ?;";
                PreparedStatement st = con.prepareStatement(sql);
                for (OrderDetail orderDetail : listOrderDetail) {
                    st.setInt(1, orderDetail.getProductID());
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
}
