/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.PC;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Zarius
 */
public class PCDAO {
    public Map<Integer, Integer> getCaseIDByProductID() {
        Map<Integer, Integer> listCaseID = new HashMap<>();
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "Select * FROM `PC`";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    PC p = new PC();
                    p.setProductID(rs.getInt(1));
                    p.setMainboardID(rs.getInt(2));
                    p.setCpuID(rs.getInt(3));
                    p.setRamID(rs.getInt(4));
                    p.setVgaID(rs.getInt(5));
                    p.setStorageID(rs.getInt(6));
                    p.setPsuID(rs.getInt(7));
                    p.setCaseID(rs.getInt(8));
                    listCaseID.put(p.getProductID(), p.getCaseID());
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listCaseID;
    }
    
    public PC getPCByProductID(int productID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `pc` where `Product_ID` = " + productID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    PC pc = new PC();
                    pc.setProductID(rs.getInt(1));
                    pc.setMainboardID(rs.getInt(2));
                    pc.setCpuID(rs.getInt(3));
                    pc.setRamID(rs.getInt(4));
                    pc.setVgaID(rs.getInt(5));
                    pc.setStorageID(rs.getInt(6));
                    pc.setPsuID(rs.getInt(7));
                    pc.setCaseID(rs.getInt(8));
                    return pc;
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
