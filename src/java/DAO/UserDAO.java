/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.User;
import Service.PasswordUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

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
                String sql = "SELECT * FROM `user` WHERE `Email` = '" + email + "';";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    String storedPassword = rs.getString(4);
                    PasswordUtils passwordUtils = new PasswordUtils();
                    if (passwordUtils.checkPassword(password, storedPassword)) {
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

    public User checkUserExist(String email) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `user` WHERE `Email` = '" + email + "'";
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

    public int register(String fullName, String email, String password, String phoneNum, String address) {
        String sql = "INSERT INTO `user` \n"
                + "values (?,?,?,?,?,?,?,'1','1')";
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setNull(1, Types.INTEGER);
            st.setString(2, fullName);
            st.setString(3, email);
            st.setString(4, password);
            st.setNull(5, Types.NVARCHAR);
            st.setString(6, phoneNum);
            st.setString(7, address);
            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public int changePassword(int user_ID, String newPass) {
        int row = 0;
        try {
            String sql = "UPDATE `user`\n"
                    + "   SET \n"
                    + "      `Password` = ?\n"
                    + " WHERE `User_ID` = ?\n";
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, newPass);
            st.setInt(2, user_ID);
            row = st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }

    public User getUser(int userID, String password) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `user` WHERE `User_ID` = '" + userID + "';";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    String storedPassword = rs.getString("Password");
                    PasswordUtils passwordUtils = new PasswordUtils();
                    if (passwordUtils.checkPassword(password, storedPassword)) {
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

    public int updateUserProfile(String fullName, String phone, String address, String avatarFile, int UserID) {
        int row = 0;
        try {
            String sql = "UPDATE `user`\n"
                    + "   SET \n"
                    + "      `FullName` = ?,\n"
                    + "      `Phone_Number` = ?,\n"
                    + "      `Address` = ?,\n"
                    + "      `Profile_picture` = ?\n"
                    + " WHERE `User_ID` = ?\n";
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, fullName);
            st.setString(2, phone);
            st.setString(3, address);
            st.setString(4, avatarFile);
            st.setInt(5, UserID);
            row = st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }

    public User getUserByID(int userID) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `user` WHERE `User_ID` = '" + userID + "';";
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

    public List<User> getAllCustomers() {
        List<User> customers = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `user` where `role_id` = 1";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
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
                    customers.add(u);
                }
                rs.close();
                con.close();
                st.close();
            }
            return customers;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public User getCustomerById(int id) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM `user` WHERE `Role_ID` = 1 AND `User_ID`=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
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
                    rs.close();
                    ps.close();
                    con.close();
                    return u;
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Map<Integer, User> getUserByUserID() {
        Map<Integer, User> listUser = new HashMap<>();
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "Select * FROM `user`";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
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
                    listUser.put(u.getUser_ID(), u);
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listUser;
    }

    public Integer getRandomSaler() {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `user` WHERE Role_ID = 2 and Status = 1 ORDER BY RAND() LIMIT 1;";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    return rs.getInt(1);
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

    public ArrayList<User> getAllUser() { // Viet: 30/05/2023
        ArrayList<User> userList = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `user`";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
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
                    userList.add(u);
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return userList;
    }

    public ArrayList<User> userDetails(int userId) {
        ArrayList<User> userDetailList = new ArrayList<>();

        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `user` where `User_ID` = '" + userId + "';";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
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
                    userDetailList.add(u);
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return userDetailList;
    }

    public int editUserInfo(User user) {
        int row = 0;
        try {
            String sql = "UPDATE `user` SET "
                    + "`FullName` = ?, "
                    + "`Profile_picture` = ?, "
                    + "`Phone_Number` = ?, "
                    + "`Address` = ?, "
                    + "`Status` = ?, "
                    + "`Role_ID` = ?\n"
                    + "WHERE `User_ID` = ?";
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getProfile_picture());
            ps.setString(3, user.getPhone_Number());
            ps.setString(4, user.getAddress());
            ps.setBoolean(5, user.isStatus());
            ps.setInt(6, user.getRole_ID());
            ps.setInt(7, user.getUser_ID());
            row = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }

    public int updateStatusUser(int userId, int i) {
        int row = 0;
        try {
            String sql = "UPDATE `user`\n"
                    + "   SET `status` = ?\n"
                    + " WHERE `User_ID` = ?";
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, i);
            st.setInt(2, userId);
            row = st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }

    public int createUser(User u) {
        int row = 0;
        try {
            String sql = "INSERT INTO `user` \n"
                    + "values (?,?,?,?,?,?,?,?,?)";
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setNull(1, Types.INTEGER);
            st.setString(2, u.getFullName());
            st.setString(3, u.getEmail());
            st.setString(4, u.getPassword());
            st.setString(5, u.getProfile_picture());
            st.setString(6, u.getPhone_Number());
            st.setString(7, u.getAddress());
            st.setBoolean(8, u.isStatus());
            st.setInt(9, u.getRole_ID());
            row = st.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }

}
