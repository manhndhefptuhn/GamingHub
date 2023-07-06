/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.CPU;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Zarius
 */
public class CPUDAO {
    public CPU getCPUByID(int cpuID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `cpu` where `CPU_ID` = " + cpuID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    CPU c = new CPU();
                    c.setCpuID(rs.getInt(1));
                    c.setCpuName(rs.getString(2));
                    c.setPrice(rs.getInt(3));
                    c.setStatus(rs.getBoolean(4));
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
