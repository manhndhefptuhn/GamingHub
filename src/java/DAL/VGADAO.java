/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.VGA;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Zarius
 */
public class VGADAO {
    public ArrayList<VGA> getThreeNewVGA() {
        ArrayList<VGA> listVGA = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `vga` WHERE Product_Status_ID = 1 and Status = 1 ORDER BY VGA_ID asc LIMIT 3;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    VGA v = new VGA();
                    v.setVgaID(rs.getInt(1));
                    v.setVgaName(rs.getString(2));
                    v.setPrice(rs.getInt(3));
                    v.setDescription(rs.getString(4));
                    v.setImage(rs.getString(5));
                    v.setStatus(rs.getBoolean(6));
                    listVGA.add(v);
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
                    vga.setDescription(rs.getString(4));
                    vga.setImage(rs.getString(5));
                    vga.setStatus(rs.getBoolean(6));
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
}
