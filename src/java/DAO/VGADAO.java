/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.VGA;
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
public class VGADAO {
    public VGA getVGAByID(int vgaID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `vga` where `VGA_ID` = " + vgaID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    VGA vga = new VGA();
                    vga.setVgaID(rs.getInt(1));
                    vga.setVgaName(rs.getString(2));
                    vga.setPrice(rs.getInt(3));
                    vga.setStatus(rs.getBoolean(4));
                    return vga;
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
    
    public List<VGA> getAllVGAActive() {
        List<VGA> vgas = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM `vga` where `status` = 1";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    VGA vga = new VGA();
                    vga.setVgaID(rs.getInt(1));
                    vga.setVgaName(rs.getString(2));
                    vga.setPrice(rs.getInt(3));
                    vga.setStatus(rs.getBoolean(4));
                    vgas.add(vga);
                }
                rs.close();
                ps.close();
                con.close();
            }
            return vgas;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

        public ArrayList<VGA> getAllVGA() {
        ArrayList<VGA> listVGA = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `vga`";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    VGA vga = new VGA();
                    vga.setVgaID(rs.getInt(1));
                    vga.setVgaName(rs.getString(2));
                    vga.setPrice(rs.getInt(3));
                    vga.setStatus(rs.getBoolean(4));
                    listVGA.add(vga);
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listVGA;
    }
}
