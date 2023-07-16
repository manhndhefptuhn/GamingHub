/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Order;
import Model.OrderStatus;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Zarius
 */
public class OrderStatusDAO {

    public Map<Integer, String> getMapOrderStatusByID(ArrayList<Order> orderList) {
        Map<Integer, String> listName = new HashMap<>();
        DBContext db = new DBContext();
        String statusName;
        int orderStatusID;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "Select * FROM `order_status` WHERE `Order_Status_ID` = ?;";
                PreparedStatement st = con.prepareStatement(sql);
                for (Order order : orderList) {
                    st.setInt(1, order.getOrderStatus());
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        orderStatusID = rs.getInt("Order_Status_ID");
                        statusName = rs.getString("Order_Status_Name");
                        listName.put(orderStatusID, statusName);
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

    public String getOrderStatusByID(int orderStatusID) {
        DBContext db = new DBContext();
        String statusName;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "Select * FROM `order_status` WHERE `Order_Status_ID` = ?;";
                PreparedStatement st = con.prepareStatement(sql);
                st.setInt(1, orderStatusID);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    statusName = rs.getString("Order_Status_Name");
                    return statusName;
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

    public ArrayList<OrderStatus> getAllOrderStatus() {
        ArrayList<OrderStatus> listOrderStatus = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `order_status`;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    OrderStatus ordst = new OrderStatus();
                    ordst.setOrderStatusID(rs.getInt(1));
                    ordst.setOrderStatusName(rs.getString(2));
                    ordst.setStatus(rs.getBoolean(3));
                    listOrderStatus.add(ordst);
                }
                rs.close();
                con.close();
                st.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listOrderStatus;
    }
}
