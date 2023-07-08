/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.User;
import Model.SearchCriteria; 
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
                String sql = "SELECT * FROM `user` WHERE `Email` = '" + email + "' and `Password` = '" + password + "';";
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
        int row = 0;
        String sql = "INSERT INTO `user` \n"
                + "values (?,?,?,?,?,?,?,'0','1')";
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setNull(1, Types.INTEGER);
            st.setString(2, fullName);
            st.setString(3, email);
            st.setString(4, password);
            st.setNull(5, Types.NVARCHAR);
            st.setString(6, phoneNum);
            st.setString(7, address);
            row = st.executeUpdate();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
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
                String sql = "SELECT * FROM `user` WHERE `User_ID` = '" + userID + "' and `Password` = '" + password + "';";
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
    
    public int updateUserProfile(String fullName, String phone, String address, String avatarFile, int UserID){
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
    
    public List<User> getAllCustomers(String search, Boolean statusFilter) {
        List<User> customers = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM user WHERE Role_ID = 1";
                if (search != null && !search.trim().isEmpty()) {
                    sql += " AND FullName LIKE ?";
                }
                if (statusFilter != null) {
                    sql += " AND Status = ?";
                }
                PreparedStatement ps = con.prepareStatement(sql);
                int parameterIndex = 1;
                if (search != null && !search.trim().isEmpty()) {
                    String searchLike = "%" + search.trim() + "%";
                    ps.setString(parameterIndex++, searchLike);
                }
                if (statusFilter != null) {
                    ps.setBoolean(parameterIndex++, statusFilter);
                }
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    User customer = new User();
                    customer.setUser_ID(rs.getInt("User_ID"));
                    customer.setFullName(rs.getString("FullName"));
                    customer.setEmail(rs.getString("Email"));
                    customer.setPassword(rs.getString("Password"));
                    customer.setProfile_picture(rs.getString("Profile_picture"));
                    customer.setPhone_Number(rs.getString("Phone_Number"));
                    customer.setAddress(rs.getString("Address"));
                    customer.setStatus(rs.getBoolean("Status"));
                    customer.setRole_ID(rs.getInt("Role_ID"));
                    customers.add(customer);
                }
                rs.close();
                ps.close();
                con.close();
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
                    User customer = new User();
                    customer.setUser_ID(rs.getInt("User_ID"));
                    customer.setFullName(rs.getString("FullName"));
                    customer.setEmail(rs.getString("Email"));
                    customer.setPassword(rs.getString("Password"));
                    customer.setProfile_picture(rs.getString("Profile_picture"));
                    customer.setPhone_Number(rs.getString("Phone_Number"));
                    customer.setAddress(rs.getString("Address"));
                    customer.setStatus(rs.getBoolean("Status"));
                    customer.setRole_ID(rs.getInt("Role_ID"));
                    rs.close();
                    ps.close();
                    con.close();
                    return customer;
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
    
    
    public static List<User> userList() { // Viet: 30/05/2023
        List<User> userList = new ArrayList<>();

        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from User";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    int id = rs.getInt("User_ID");
                    String fullName = rs.getString("FullName");
                    String email = rs.getString("Email");
                    String phone_number = rs.getString("Phone_Number");
                    boolean status = rs.getBoolean("Status");

                    User user = new User(id, fullName, email, phone_number, status);
                    userList.add(user);
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

    public static List<User> userDetails(int userId) {
        List<User> userDetailList = new ArrayList<>();

        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from User where User_ID = '" + userId + "'";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    int id = rs.getInt("User_ID");
                    String fullName = rs.getString("FullName");
                    String email = rs.getString("Email");
                    String password = rs.getString("Password");
                    String profile_picture = rs.getString("Profile_picture");
                    String phone_number = rs.getString("Phone_Number");
                    String address = rs.getString("Address");
                    boolean status = rs.getBoolean("Status");
                    int role_ID = rs.getInt("Role_ID");

                    User user = new User(userId, fullName, email, password, profile_picture, phone_number, address, status, role_ID);
                    userDetailList.add(user);
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

    public User getUserById(String userID) {
        User user = new User();

        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();

            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM User WHERE User_ID = '" + userID + "'";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    user.setUser_ID(rs.getInt("User_ID"));
                    user.setFullName(rs.getString("FullName"));
                    user.setEmail(rs.getString("Email"));
                    user.setPassword(rs.getString("Password"));
                    user.setProfile_picture(rs.getString("Profile_picture"));
                    user.setPhone_Number(rs.getString("Phone_Number"));
                    user.setAddress(rs.getString("Address"));
                    user.setStatus(rs.getBoolean("Status"));
                    user.setRole_ID(rs.getInt("Role_ID"));
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return user;
    }

    public int editUserInfo(User user) {
        int row = 0;
        try {
            String sql = "UPDATE User SET "
                    + "FullName = ?, "
                    + "Email = ?, "
                    + "Password = ?, "
                    + "Profile_picture = ?, "
                    + "Phone_Number = ?, "
                    + "Address = ?, "
                    + "Status = ?, "
                    + "Role_ID = ? "
                    + "WHERE User_ID = ?";
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getProfile_picture());
            ps.setString(5, user.getPhone_Number());
            ps.setString(6, user.getAddress());
            ps.setBoolean(7, user.isStatus());
            ps.setInt(8, user.getRole_ID());
            ps.setInt(9, user.getUser_ID());
            row = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            row = -1;
        }
        return row;
    }

    public List<User> getUsersByCriteria(SearchCriteria criteria) {
        List<User> userList = new ArrayList<>();

        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                /*
                    WHERE 1=1: This is a condition that always evaluates to true. 
                    It's commonly used as a placeholder condition that allows us to 
                    dynamically add additional conditions to the query using the StringBuilder object.
                 */
                StringBuilder sql = new StringBuilder("SELECT * FROM `user` WHERE 1=1");

                if (criteria.getID() != null && !criteria.getID().isEmpty()) {
                    sql.append(" AND `User_ID` = '").append(criteria.getID()).append("'");
                }
                if (criteria.getFullName() != null && !criteria.getFullName().isEmpty()) {
                    sql.append(" AND `FullName` = '").append(criteria.getFullName()).append("'");
                }
                if (criteria.getEmail() != null && !criteria.getEmail().isEmpty()) {
                    sql.append(" AND `Email` = '").append(criteria.getEmail()).append("'");
                }
                if (criteria.getPhoneNumber() != null && !criteria.getPhoneNumber().isEmpty()) {
                    sql.append(" AND `Phone_Number` = '").append(criteria.getPhoneNumber()).append("'");
                }
                if (criteria.getAddress() != null && !criteria.getAddress().isEmpty()) {
                    sql.append(" AND `Address` = '").append(criteria.getAddress()).append("'");
                }

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql.toString());
                while (rs.next()) {
                    User user = new User();
                    user.setUser_ID(rs.getInt(1));
                    user.setFullName(rs.getString(2));
                    user.setEmail(rs.getString(3));
                    user.setPassword(rs.getString(4));
                    user.setProfile_picture(rs.getString(5));
                    user.setPhone_Number(rs.getString(6));
                    user.setAddress(rs.getString(7));
                    user.setStatus(rs.getBoolean(8));
                    user.setRole_ID(rs.getInt(9));
                    userList.add(user);
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
}
