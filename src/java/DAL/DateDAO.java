/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Model.Date;

/**
 *
 * @author son22
 */
public class DateDAO extends DBContext {

    public int CountDayByStartEnd(String start, String end) throws Exception {
        String sql = "SELECT ABS(DATEDIFF(?, ?))";
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, start);
            st.setString(2, end);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public Date get7day() throws Exception {
        String sql = "SELECT CURDATE(), DATE_SUB(CURDATE(), INTERVAL 6 DAY)";
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
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

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
//        String start = ""; 
//        String end = ""; 
//        try {
//            Date date = get7day();
//            start = date.getStart().toString();
//            end = date.getEnd().toString();
//            System.out.println(start);
//            System.out.println(end);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

//        start = "2023-07-10";
//        end = "2023-07-17";
//        
//        try {
//            int date = CountDayByStartEnd(start, end); 
//            System.out.println(date);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

    }

}
