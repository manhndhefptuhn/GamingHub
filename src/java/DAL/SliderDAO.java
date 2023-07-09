/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Slider;
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
public class SliderDAO {

    public ArrayList<Slider> getAllSlider() {
        ArrayList<Slider> listSlider = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `slider`";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Slider sl = new Slider();
                    sl.setSliderID(rs.getInt(1));
                    sl.setSliderTitle(rs.getString(2));
                    sl.setSliderImage(rs.getString(3));
                    sl.setBacklink(rs.getString(4));
                    sl.setNote(rs.getString(5));
                    sl.setStatus(rs.getBoolean(6));
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

    public ArrayList<Slider> getSliderInHome() {
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

    public int deleteSlider(int id) {
        int row = 0;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "DELETE FROM `slider` WHERE `slider_id` = " + id + ";";
                row = st.executeUpdate(sql);
                st.close();
                con.close();
            }
        } catch (Exception e) {
            row = -1;
            System.out.println(e.getMessage());
        }
        return row;
    }

    public Slider getSliderById(int sliderID) {
        Slider slider = new Slider();

        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();

            if (con != null) {
                Statement st = con.createStatement();
                String sql = "Select * from slider where slider_id = '" + sliderID + "'";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    slider.setSliderID(rs.getInt("Slider_id"));
                    slider.setSliderTitle(rs.getString("Slider_title"));
                    slider.setSliderImage(rs.getString("Slider_Image"));
                    slider.setBacklink(rs.getString("Backlink"));
                    slider.setNote(rs.getString("Note"));
                    slider.setStatus(rs.getBoolean("Status"));
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return slider;
    }

    public ArrayList<Slider> getSliderByID(int id) {
        ArrayList<Slider> listSlider = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `slider` where `slider_id` = " + id + ";";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Slider sl = new Slider();
                    sl.setSliderID(rs.getInt(1));
                    sl.setSliderTitle(rs.getString(2));
                    sl.setSliderImage(rs.getString(3));
                    sl.setBacklink(rs.getString(4));
                    sl.setNote(rs.getString(5));
                    sl.setStatus(rs.getBoolean(6));
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

    public int editSliderInfo(Slider slider) {
        int row = 0;
        try {
            String sql = "UPDATE `slider` SET "
                    + "`Slider_Title` = ?, "
                    + "`Slider_Image` = ?, "
                    + "`Backlink` = ?, "
                    + "`Note` = ?, "
                    + "`Status` = ?\n"
                    + "WHERE `slider_id` = ?";
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, slider.getSliderTitle());
            ps.setString(2, slider.getSliderImage());
            ps.setString(3, slider.getBacklink());
            ps.setString(4, slider.getNote());
            ps.setBoolean(5, slider.isStatus());
            ps.setInt(6, slider.getSliderID());
            row = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }
}
