/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.CPU;
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
     public List<CPU> getAllCPUActive() {
        List<CPU> cpus = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM `cpu` where `status` = 1";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    CPU cpu = new CPU();
                    cpu.setCpuID(rs.getInt(1));
                    cpu.setCpuName(rs.getString(2));
                    cpu.setPrice(rs.getInt(3));
                    cpu.setStatus(rs.getBoolean(4));
                    cpus.add(cpu);
                }
                rs.close();
                ps.close();
                con.close();
            }
            return cpus;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public int getCPUIDByName(String cpuName) {
        int cpuID = -1;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT CPU_ID FROM cpu WHERE CPU_Name LIKE ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, "%" + cpuName + "%");
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    cpuID = rs.getInt(1);
                }
                rs.close();
                ps.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return cpuID;
    }
    
    public ArrayList<CPU> getAllCPU() {
        ArrayList<CPU> listCPU = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `cpu`";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    CPU cpu = new CPU();
                    cpu.setCpuID(rs.getInt(1));
                    cpu.setCpuName(rs.getString(2));
                    cpu.setPrice(rs.getInt(3));
                    cpu.setStatus(rs.getBoolean(4));
                    listCPU.add(cpu);
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listCPU;
    }
}
