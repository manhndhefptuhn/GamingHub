/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Model.Date;

/**
 *
 * @author Zarius
 */
public class DateDAO extends DBContext {

    public int CountDayByStartEnd(String start, String end) throws Exception {
        DBContext db = new DBContext();
        try ( Connection con = db.getConnection()) {
            if (con != null) {
                String sql = "SELECT ABS(DATEDIFF(?, ?))";
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, start);
                st.setString(2, end);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1) + 1;
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public Date get7day() throws Exception {
        DBContext db = new DBContext();
        try ( Connection con = db.getConnection()) {
            if (con != null) {
                String sql = "SELECT CURDATE(), DATE_SUB(CURDATE(), INTERVAL 6 DAY)";
                PreparedStatement st = con.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Date.Builder builder = new Date().new Builder();
                    Date date = builder
                            .setStart(rs.getDate(2))
                            .setEnd(rs.getDate(1))
                            .build();

                    return date;
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
