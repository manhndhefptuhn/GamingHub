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
import java.util.ArrayList;

/**
 *
 * @author Zarius
 */
public class CPUDAO {
    public ArrayList<CPU> getThreeRandomCPU() {
        ArrayList<CPU> listRand = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `cpu` ORDER BY RAND() asc LIMIT 3;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    CPU c = new CPU();
                    c.setCpuID(rs.getInt(1));
                    c.setCpuName(rs.getString(2));
                    c.setPrice(rs.getInt(3));
                    c.setDescription(rs.getString(4));
                    c.setImage(rs.getString(5));
                    c.setComponentID(rs.getInt(6));
                    listRand.add(c);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listRand;
    }
}
