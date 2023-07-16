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
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import Model.Chart;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Zarius
 */
public class OrderDAO {

    public int addNewORder(int userID, String fullName, String address, String phoneNumber, int totalCost, String paymentMethod, int salerID, String note) {

        String sql = "INSERT INTO `order` \n"
                + "values (?,?,?,?,?,?,?,?,?,?,?)";
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setNull(1, Types.INTEGER);
            st.setInt(2, userID);
            st.setString(3, fullName);
            st.setString(4, address);
            st.setString(5, phoneNumber);
            st.setDate(6, new java.sql.Date(System.currentTimeMillis()));
            st.setInt(7, totalCost);
            st.setString(8, paymentMethod);
            st.setInt(9, salerID);
            st.setInt(10, 1);
            st.setString(11, note);
            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
            rs.close();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public ArrayList<Order> getAllOrderByUserID(int userID) {
        ArrayList<Order> listOrder = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * from `order` WHERE `User_ID` = " + userID + ";";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Order o = new Order();
                    o.setOrderID(rs.getInt(1));
                    o.setUserID(rs.getInt(2));
                    o.setFullName(rs.getString(3));
                    o.setAddress(rs.getString(4));
                    o.setPhoneNumber(rs.getString(5));
                    o.setOrderDate(rs.getDate(6));
                    o.setTotalCost(rs.getInt(7));
                    o.setPayment(rs.getString(8));
                    o.setSaleID(rs.getInt(9));
                    o.setOrderStatus(rs.getInt(10));
                    o.setNote(rs.getString(11));
                    listOrder.add(o);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listOrder;
    }

    public Order getOrderInformationByID(int orderID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * from `order` WHERE `Order_ID` = " + orderID + ";";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Order o = new Order();
                    o.setOrderID(rs.getInt(1));
                    o.setUserID(rs.getInt(2));
                    o.setFullName(rs.getString(3));
                    o.setAddress(rs.getString(4));
                    o.setPhoneNumber(rs.getString(5));
                    o.setOrderDate(rs.getDate(6));
                    o.setTotalCost(rs.getInt(7));
                    o.setPayment(rs.getString(8));
                    o.setSaleID(rs.getInt(9));
                    o.setOrderStatus(rs.getInt(10));
                    o.setNote(rs.getString(11));
                    return o;
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

    public int updateNote(int orderID, String note) {
        int row = 0;
        try {
            String sql = "UPDATE `order`\n"
                    + "   SET `note` = ?\n"
                    + " WHERE `Order_ID` = ?";
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, note);
            st.setInt(2, orderID);
            row = st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }

    public int updateOrderStatus(int orderID, int i) {
        int row = 0;
        try {
            String sql = "UPDATE `order`\n"
                    + "   SET `Order_Status` = ?\n"
                    + " WHERE `Order_ID` = ?";
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, i);
            st.setInt(2, orderID);
            row = st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }

    public int deleteOrder(int orderID) {
        int row = 0;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "DELETE FROM `order` WHERE `Order_ID` = " + orderID + ";";
                row = st.executeUpdate(sql);
                st.close();
                con.close();
            }
        } catch (Exception e) {
            row = -1;
            System.out.println(e.getMessage());
        }
        return row;
    }

    public int getTotalOrderType(String salerId, String start, String end, int orderStatus) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "select count(*) from `order` where `Saler_ID` = " + salerId + "  "
                        + "and `Order_Date` <= ?  and `Order_Date` >= ? and `Order_Status` = ? ";
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, end);
                st.setString(2, start);
                st.setInt(3, orderStatus);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public int getTotalOrder(String salerId, String start, String end) {

        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "select count(*) from `order` where `Saler_ID` " + salerId + "  and `Order_Date` <= ?  and `Order_Date` >= ?";
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, end);
                st.setString(2, start);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
    
    public List<Order> getAllOrder() {
        List<Order> listOrder = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * from `order`";
                PreparedStatement st = con.prepareStatement(sql);
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Order o = new Order();
                    o.setOrderID(rs.getInt(1));
                    o.setUserID(rs.getInt(2));
                    o.setFullName(rs.getString(3));
                    o.setPhoneNumber(rs.getString(4));
                    o.setAddress(rs.getString(5));
                    o.setOrderDate(rs.getDate(6));
                    o.setTotalCost(rs.getInt(7));
                    o.setPayment(rs.getString(8));
                    o.setSaleID(rs.getInt(9));
                    o.setOrderStatus(rs.getInt(10));
                    o.setNote(rs.getString(11));
                    listOrder.add(o);
                }
                rs.close();
                st.close();
                con.close();
                return listOrder;
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public List<OrderStatus> getAllOrderStatus() {
        List<OrderStatus> orderStatusList = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection conn = db.getConnection();
            if (conn != null) {
                Statement stmt = conn.createStatement();
                String sql = "SELECT * FROM order_status";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    OrderStatus orderStatus = new OrderStatus();
                    orderStatus.setOrderStatusID(rs.getInt(1));
                    orderStatus.setOrderStatusName(rs.getString(2));
                    orderStatus.setStatus(rs.getBoolean(3));
                    orderStatusList.add(orderStatus);
                }
                rs.close();
                stmt.close();
                conn.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return orderStatusList;
    }
    
    public OrderStatus getOrderStatusByID(int orderStatusID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `order_status` where `order_status_ID` = " + orderStatusID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    OrderStatus o = new OrderStatus();
                    o.setOrderStatusID(rs.getInt(1));
                    o.setOrderStatusName(rs.getString(2));
                    o.setStatus(rs.getBoolean(3));
                    return o;
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
    
    public String getOrderStatusNameByID(int orderStatusID) {
        String orderStatusName = null;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT order_status_name FROM order_status WHERE order_status_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, orderStatusID);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    orderStatusName = rs.getString(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return orderStatusName;
    }
    public Order getOrderByID(int orderID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `order` WHERE Order_ID = " + orderID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    Order o = new Order();
                    o.setOrderID(rs.getInt(1));
                    o.setUserID(rs.getInt(2));
                    o.setFullName(rs.getString(3));
                    o.setPhoneNumber(rs.getString(4));
                    o.setAddress(rs.getString(5));
                    o.setOrderDate(rs.getDate(6));
                    o.setTotalCost(rs.getInt(7));
                    o.setPayment(rs.getString(8));
                    o.setSaleID(rs.getInt(9));
                    o.setOrderStatus(rs.getInt(10));
                    o.setNote(rs.getString(11));
                    return o;
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
    
    public void updateOrderStatus(Order order) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "UPDATE `order` SET Order_Status = ? WHERE Order_ID = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, order.getOrderStatus());
                ps.setInt(2, order.getOrderID());
                ps.executeUpdate();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public int getOrderStatusIDByOrderID(int id) {
        int OrderStatusID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT Order_Status FROM `order` WHERE Order_ID = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    OrderStatusID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return OrderStatusID;
    }
    
    public List<Chart> getChartRevenueArea(String salerId, String start, int day) throws Exception {
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            String sql = "SELECT SUM(total_cost) FROM `Order` WHERE saler_id = ? AND Order_Date <= DATE_ADD(?, INTERVAL ? DAY) AND Order_Date >= ?";
            try {
                DBContext db = new DBContext();
                Connection con = db.getConnection();
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, salerId);
                st.setString(2, start);
                st.setInt(3, i);
                st.setString(4, start);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    value = rs.getInt(1);
                }

                sql = "SELECT DATE_ADD(?, INTERVAL ? DAY)";
                st = con.prepareStatement(sql);
                st.setString(1, start);
                st.setInt(2, i);
                rs = st.executeQuery();
                while (rs.next()) {
                    Chart.ChartBuilder builder = new Chart().new ChartBuilder();
                    Chart c = builder
                            .date(rs.getDate(1))
                            .value(value)
                            .build();
                    list.add(c);
                }

            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return list;
    }
}
