/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Mainboard;
import Model.PSU;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

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
                    psu.setDescription(rs.getString(4));
                    psu.setImage(rs.getString(5));
                    psu.setStatus(rs.getBoolean(6));
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
}
