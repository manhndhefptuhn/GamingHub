/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.Roles;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Zarius
 */
public class RoleDAO {

    public String getRoleNameByID(int Role_ID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `roles` where `Role_ID` = " + Role_ID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    Roles r = new Roles();
                    r.setRoleName(rs.getString(2));
                    return r.getRoleName();
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

    public ArrayList<Roles> getAllRole() {
        ArrayList<Roles> roleList = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `roles`";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Roles r = new Roles();
                    r.setRoleID(rs.getInt(1));
                    r.setRoleName(rs.getString(2));
                    roleList.add(r);
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return roleList;
    }

    public Map<Integer, String> getMapRoleNameByID(ArrayList<User> userList) {
        Map<Integer, String> listName = new HashMap<>();
        DBContext db = new DBContext();
        String roleName;
        int roleID;
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "Select * FROM `roles` WHERE `Role_ID` = ?;";
                PreparedStatement st = con.prepareStatement(sql);
                for (User user : userList) {
                    st.setInt(1, user.getRole_ID());
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        roleID = rs.getInt("Role_ID");
                        roleName = rs.getString("Role_name");
                        listName.put(roleID, roleName);
                    }
                    rs.close();
                }
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listName;
    }
    
    public Roles getRoleViaID(int Role_ID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `roles` where `Role_ID` = " + Role_ID + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    Roles r = new Roles();
                    r.setRoleID(rs.getInt(1));
                    r.setRoleName(rs.getString(2));
                    return r;
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
    
    public int editRoleInfo(Roles role){
        int row = 0; 
        try {
            String sql = "UPDATE `roles` SET role_name = ? WHERE role_id = ?";
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, role.getRoleName());
            ps.setInt(2, role.getRoleID());
            row = ps.executeUpdate(); 
        } catch (Exception ex){
            System.out.println(ex.getMessage());
            ex.printStackTrace();
            row = -1; 
        }
        return row; 
    }
    
    public int createRole(Roles createRole){
        int row = 0; 

        String sql = "INSERT INTO roles (role_id, role_name) VALUES (?, ?)";
        
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setNull(1, Types.INTEGER);
            st.setString(2, createRole.getRoleName());
            row = st.executeUpdate();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;

    }
}
