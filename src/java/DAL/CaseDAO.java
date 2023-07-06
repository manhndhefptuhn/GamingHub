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

    public Map<Integer, Case> getCaseByCaseID() {
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
                    c.setImage(rs.getString(4));
                    c.setStatus(rs.getBoolean(5));
                    listImage.put(c.getCaseID(), c);
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listImage;
    }
    
    public Case getCaseByID(int caseID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `case` where `Case_ID` = " + caseID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    Case c = new Case();
                    c.setCaseID(rs.getInt(1));
                    c.setCaseName(rs.getString(2));
                    c.setPrice(rs.getInt(3));
                    c.setImage(rs.getString(4));
                    c.setStatus(rs.getBoolean(5));
                    return c;
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
