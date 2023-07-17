/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Mainboard;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Zarius
 */
public class MainboardDAO {

    public Mainboard getMainboardByID(int mainboardID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `mainboard` where `Mainboard_ID` = " + mainboardID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    Mainboard m = new Mainboard();
                    m.setMainboardID(rs.getInt(1));
                    m.setMainboardName(rs.getString(2));
                    m.setPrice(rs.getInt(3));
                    m.setStatus(rs.getBoolean(4));
                    return m;
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
    
    public List<Mainboard> getAllMainboardActive() {
        List<Mainboard> mainboards = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM `mainboard` where `status` = 1";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Mainboard m = new Mainboard();
                    m.setMainboardID(rs.getInt(1));
                    m.setMainboardName(rs.getString(2));
                    m.setPrice(rs.getInt(3));
                    m.setStatus(rs.getBoolean(4));
                    mainboards.add(m);
                }
                rs.close();
                ps.close();
                con.close();
            }
            return mainboards;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public int getMainboardIDByName(String mainboardName) {
        int mainboardID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT Mainboard_ID FROM mainboard WHERE Mainboard_Name LIKE ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, "%" + mainboardName + "%");
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    mainboardID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return mainboardID;
    }
    
       public ArrayList<Mainboard> getAllMainboard() {
        ArrayList<Mainboard> listMainboard = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `mainboard`";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Mainboard mainboard = new Mainboard();
                    mainboard.setMainboardID(rs.getInt(1));
                    mainboard.setMainboardName(rs.getString(2));
                    mainboard.setPrice(rs.getInt(3));
                    mainboard.setStatus(rs.getBoolean(4));
                    listMainboard.add(mainboard);
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listMainboard;
    }
}
