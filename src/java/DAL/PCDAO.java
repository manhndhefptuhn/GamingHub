/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.PC;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
                String sql = "Select `Product_ID`, `Case_ID` FROM `pc`";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    listCaseID.put(rs.getInt("Product_ID"), rs.getInt("Case_ID"));
                }
                rs.close();
                st.close();
                con.close();
            } else {
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

    public Map<String, String> getProductSpecification(int productID) {
        Map<String, String> specificationMap = new HashMap<>();
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT m.mainboard_Name, c.CPU_Name, r.RAM_Name, v.VGA_Name, s.Storage_Name, p.PSU_Name, ca.Case_Name\n"
                        + "FROM `pc`\n"
                        + "INNER JOIN `mainboard` m ON pc.Mainboard_ID = m.Mainboard_ID\n"
                        + "INNER JOIN `cpu` c ON pc.CPU_ID = c.CPU_ID\n"
                        + "INNER JOIN `ram` r ON pc.RAM_ID = r.RAM_ID\n"
                        + "INNER JOIN `vga` v ON pc.VGA_ID = v.VGA_ID\n"
                        + "INNER JOIN `storage` s ON pc.Storage_ID = s.Storage_ID\n"
                        + "INNER JOIN `psu` p ON pc.PSU_ID = p.PSU_ID\n"
                        + "INNER JOIN `case` ca ON pc.Case_ID = ca.Case_ID\n"
                        + "WHERE pc.product_ID = ?";
                PreparedStatement st = con.prepareStatement(sql);
                st.setInt(1, productID);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    specificationMap.put("mainboardName", rs.getString(1));
                    specificationMap.put("cpuName", rs.getString(2));
                    specificationMap.put("ramName", rs.getString(3));
                    specificationMap.put("vgaName", rs.getString(4));
                    specificationMap.put("storageName", rs.getString(5));
                    specificationMap.put("psuName", rs.getString(6));
                    specificationMap.put("caseName", rs.getString(7));
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return specificationMap;
    }

}
