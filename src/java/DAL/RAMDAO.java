/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.RAM;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Zarius
 */
public class RAMDAO {
    public ArrayList<RAM> getThreeNewRAM() {
        ArrayList<RAM> listRAM = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `ram` WHERE Product_Status_ID = 1 and Status = 1 ORDER BY RAM_ID asc LIMIT 3;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    RAM r = new RAM();
                    r.setRamID(rs.getInt(1));
                    r.setRamName(rs.getString(2));
                    r.setPrice(rs.getInt(3));
                    r.setDescription(rs.getString(4));
                    r.setImage(rs.getString(5));
                    r.setStatus(rs.getBoolean(6));
                    listRAM.add(r);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listRAM;
    }
    
    public RAM getRAMByID(int ramID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `ram` where `RAM_ID` = " + ramID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    RAM ram = new RAM();
                    ram.setRamID(rs.getInt(1));
                    ram.setRamName(rs.getString(2));
                    ram.setPrice(rs.getInt(3));
                    ram.setDescription(rs.getString(4));
                    ram.setImage(rs.getString(5));
                    ram.setStatus(rs.getBoolean(6));
                    return ram;
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
