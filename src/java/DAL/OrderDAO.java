/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;

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
}
