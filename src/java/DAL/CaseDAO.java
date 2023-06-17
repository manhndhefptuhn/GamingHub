/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Case;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Zarius
 */
public class CaseDAO {

    public Map<Integer, Case> getCaseByID() {
        Map<Integer, Case> listImage = new HashMap<>();
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            if (con != null) {
                System.out.println("Connected");
                String sql = "Select * FROM `case`";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Case c = new Case();
                    c.setCaseID(rs.getInt(1));
                    c.setCaseName(rs.getString(2));
                    c.setPrice(rs.getInt(3));
                    c.setDescription(rs.getString(4));
                    c.setImage(rs.getString(5));
                    c.setComponentID(rs.getInt(6));
                    listImage.put(c.getCaseID(), c);
                }
                rs.close();
                st.close();
                con.close();
            } else {
                System.out.println("Not connected");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listImage;
    }

    public int getCaseIDByProductID(int productID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT c.* FROM `case` as c INNER JOIN `pc` as pc "
                        + "ON c.Case_ID = pc.Case_ID where pc.product_ID =" + productID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    Case c = new Case();
                    c.setCaseID(rs.getInt(1));
                    return c.getCaseID();
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return -1;
    }
}
