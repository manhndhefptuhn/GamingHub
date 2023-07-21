/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.PSU;
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
public class PSUDAO {
    public PSU getPSUByID(int psuID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `psu` where `PSU_ID` = " + psuID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    PSU psu = new PSU();
                    psu.setPsuID(rs.getInt(1));
                    psu.setPsuName(rs.getString(2));
                    psu.setPrice(rs.getInt(3));
                    psu.setStatus(rs.getBoolean(4));
                    return psu;
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
    
    public List<PSU> getAllPSUActive() {
        List<PSU> psus = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM `psu` where `status` = 1";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    PSU psu = new PSU();
                    psu.setPsuID(rs.getInt(1));
                    psu.setPsuName(rs.getString(2));
                    psu.setPrice(rs.getInt(3));
                    psu.setStatus(rs.getBoolean(4));
                    psus.add(psu);
                }
                rs.close();
                ps.close();
                con.close();
            }
            return psus;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public ArrayList<PSU> getAllPSU() {
        ArrayList<PSU> listPSU = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `psu`";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    PSU psu = new PSU();
                    psu.setPsuID(rs.getInt(1));
                    psu.setPsuName(rs.getString(2));
                    psu.setPrice(rs.getInt(3));
                    psu.setStatus(rs.getBoolean(4));
                    listPSU.add(psu);
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listPSU;
    }
}
