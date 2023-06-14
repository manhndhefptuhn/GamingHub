/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Slider;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Zarius
 */
public class SliderDAO {
    public ArrayList<Slider> getAllSlider() {
        ArrayList<Slider> listSlider = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `slider` where status = '1';";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Slider sl = new Slider();
                    sl.setSliderID(rs.getInt(1));
                    sl.setSliderTitle(rs.getString(2));
                    sl.setSliderImage(rs.getString(3));
                    sl.setBacklink(rs.getString(4));
                    sl.setNote(rs.getString(5));
                    sl.setStatus(rs.getBoolean(6));
                    sl.setUpdatedBy(rs.getInt(7));
                    listSlider.add(sl);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listSlider;
    }
}
