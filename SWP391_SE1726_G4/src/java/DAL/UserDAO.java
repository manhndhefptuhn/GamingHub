/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Zarius
 */
public class UserDAO {
     public User login(String email, String password) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM [User] WHERE [Email] = '" + email + "' and [Password] = '" + password + "'";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    User u = new User();
                    u.setUser_ID(rs.getInt(1));
                    u.setFullName(rs.getString(2));
                    u.setEmail(rs.getString(3));
                    u.setPassword(rs.getString(4));
                    u.setProfile_picture(rs.getString(5));
                    u.setPhone_Number(rs.getString(6));
                    u.setAddress(rs.getString(7));
                    u.setStatus(rs.getBoolean(8));
                    u.setRole_ID(rs.getInt(9));
                    return u;
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
