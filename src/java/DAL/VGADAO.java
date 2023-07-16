/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

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
    
    public List<VGA> getAllVGA() {
        List<VGA> vgas = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM vga";
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

    public int getVGAIDByName(String vgaName) {
        int vgaID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT VGA_ID FROM vga WHERE Vga_Name LIKE ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, "%" + vgaName + "%");
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    vgaID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return vgaID;
    }
}
