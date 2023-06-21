/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.PasswordReset;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;

/**
 *
 * @author Zarius
 */
public class PasswordResetDAO {

    public int resetPassword(int userID, String resetPassword) {
        int row = 0;
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String sql = "INSERT INTO `password_reset` \n"
                + "values (?,?,?,?)";
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setNull(1, Types.INTEGER);
            st.setInt(2, userID);
            st.setString(3, resetPassword);
            st.setTimestamp(4, timestamp);
            row = st.executeUpdate();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }

    public PasswordReset checkExistRecord(int userID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `password_reset` WHERE `User_ID` = " + userID + "";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    PasswordReset pwrs = new PasswordReset();
                    pwrs.setResetID(rs.getInt(1));
                    pwrs.setUserID(rs.getInt(2));
                    pwrs.setResetPassword(rs.getString(3));
                    pwrs.setTimeCreated(rs.getTimestamp(4));
                    return pwrs;
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

    public int deleteRecord(int user_ID) {
        int row = 0;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "DELETE FROM `password_reset` WHERE `User_ID` = " + user_ID + ";";
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

    public int updateResetPassword(int resetID, String resetPassword) {
        int row = 0;
        try {
            String sql = "UPDATE `password_reset`\n"
                    + "   SET \n"
                    + "      `Reset_Password` = ?\n, `Time_created` = ?\n"
                    + " WHERE `Reset_ID` = ?\n";
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            st.setString(1, resetPassword);
            st.setTimestamp(2, timestamp);
            st.setInt(3, resetID);
            row = st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }
}
