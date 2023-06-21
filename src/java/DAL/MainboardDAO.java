/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Mainboard;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

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
                    m.setDescription(rs.getString(4));
                    m.setImage(rs.getString(5));
                    m.setStatus(rs.getBoolean(6));
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
}
