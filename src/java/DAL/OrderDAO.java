/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;

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
}
