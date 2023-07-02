/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author admin
 */

import Context.DBContext;
import Model.Feedback;
import Model.FeedbackDashboard;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class FeedbackDAO {
    

    
    public ArrayList<Feedback> getFeedback() {
        ArrayList<Feedback> listFeedback = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `feedback`;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Feedback f = new Feedback();
                    f.setFeedbackId(rs.getInt(1));
                    f.setUserId(rs.getInt(2));
                    f.setProductId(rs.getInt(3));
                    f.setCreateDate(rs.getDate(4));
                    f.setContent(rs.getString(5));
                    f.setImage(rs.getString(6));
                    f.setRating(rs.getDouble(7));
                    f.setStatus(rs.getBoolean(8));
                    listFeedback.add(f);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listFeedback;
    }
    
    
    public ArrayList<Feedback> getFeedbackByStatus0() {
        ArrayList<Feedback> listFeedback = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `feedback` where status = 0;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Feedback f = new Feedback();
                    f.setFeedbackId(rs.getInt(1));
                    f.setUserId(rs.getInt(2));
                    f.setProductId(rs.getInt(3));
                    f.setCreateDate(rs.getDate(4));
                    f.setContent(rs.getString(5));
                    f.setImage(rs.getString(6));
                    f.setRating(rs.getDouble(7));
                    f.setStatus(rs.getBoolean(8));
                    listFeedback.add(f);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listFeedback;
    }
    
    
    
    public ArrayList<Feedback> getFeedbackByStatus1() {
        ArrayList<Feedback> listFeedback = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `feedback` where status = 1;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Feedback f = new Feedback();
                    f.setFeedbackId(rs.getInt(1));
                    f.setUserId(rs.getInt(2));
                    f.setProductId(rs.getInt(3));
                    f.setCreateDate(rs.getDate(4));
                    f.setContent(rs.getString(5));
                    f.setImage(rs.getString(6));
                    f.setRating(rs.getDouble(7));
                    f.setStatus(rs.getBoolean(8));
                    listFeedback.add(f);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listFeedback;
    }
    
    //be den lon
    public ArrayList<Feedback> getFeedbackByRatingAsc() {
        ArrayList<Feedback> listFeedback = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `feedback` order by rating asc;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Feedback f = new Feedback();
                    f.setFeedbackId(rs.getInt(1));
                    f.setUserId(rs.getInt(2));
                    f.setProductId(rs.getInt(3));
                    f.setCreateDate(rs.getDate(4));
                    f.setContent(rs.getString(5));
                    f.setImage(rs.getString(6));
                    f.setRating(rs.getDouble(7));
                    f.setStatus(rs.getBoolean(8));
                    listFeedback.add(f);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listFeedback;
    }
    
    
    public ArrayList<Feedback> getFeedbackByRatingDesc() {
        ArrayList<Feedback> listFeedback = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `feedback` order by rating desc;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Feedback f = new Feedback();
                    f.setFeedbackId(rs.getInt(1));
                    f.setUserId(rs.getInt(2));
                    f.setProductId(rs.getInt(3));
                    f.setCreateDate(rs.getDate(4));
                    f.setContent(rs.getString(5));
                    f.setImage(rs.getString(6));
                    f.setRating(rs.getDouble(7));
                    f.setStatus(rs.getBoolean(8));
                    listFeedback.add(f);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listFeedback;
    }
    
    
    //get details for feedback onclick with id
    public Feedback getFeedbackDetails(String feedbackId) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `feedback` where `Feedback_ID` =" +feedbackId+";";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Feedback f = new Feedback();
                    f.setFeedbackId(rs.getInt(1));
                    f.setUserId(rs.getInt(2));
                    f.setProductId(rs.getInt(3));
                    f.setCreateDate(rs.getDate(4));
                    f.setContent(rs.getString(5));
                    f.setImage(rs.getString(6));
                    f.setRating(rs.getDouble(7));
                    f.setStatus(rs.getBoolean(8));
                    
                    return f;
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
    
    
    
    
    //get feedback details via Feedback_ID
    public ArrayList<Feedback> getFeedbackWithId(String feedbackId) {
        ArrayList<Feedback> listFeedback = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `feedback` where `Feedback_ID` = " +feedbackId+ ";";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Feedback f = new Feedback();
                    f.setFeedbackId(rs.getInt(1));
                    f.setUserId(rs.getInt(2));
                    f.setProductId(rs.getInt(3));
                    f.setCreateDate(rs.getDate(4));
                    f.setContent(rs.getString(5));
                    f.setImage(rs.getString(6));
                    f.setRating(rs.getDouble(7));
                    f.setStatus(rs.getBoolean(8));
                    listFeedback.add(f);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listFeedback;
    }
    
    //Get feedback via feedback name   
    public ArrayList<Feedback> getFeedbackWithName(String feedbackName) {
        ArrayList<Feedback> listFeedback = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `feedback` where `Content` like '%" +feedbackName+ "%';";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Feedback f = new Feedback();
                    f.setFeedbackId(rs.getInt(1));
                    f.setUserId(rs.getInt(2));
                    f.setProductId(rs.getInt(3));
                    f.setCreateDate(rs.getDate(4));
                    f.setContent(rs.getString(5));
                    f.setImage(rs.getString(6));
                    f.setRating(rs.getDouble(7));
                    f.setStatus(rs.getBoolean(8));
                    listFeedback.add(f);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listFeedback;
    }
    
    

    
    
    
    //for dashboard info
    public ArrayList<FeedbackDashboard> getFeedbackDashboardInfo() {
        ArrayList<FeedbackDashboard> listFeedback = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                FeedbackDashboard f = new FeedbackDashboard();
                String sql = "select count(Feedback_ID) from `feedback`;";               
                String sql2 = "select count(status) from `feedback` where status =0;";               
                String sql3 = "select count(User_ID) from `user` where Role_ID =1;";              
                String sql4 = "select avg(Rating) from `feedback`;";
                
                
                ResultSet rs = st.executeQuery(sql);
                rs.next();
                f.setTotalFeedback(rs.getInt(1));
                
                rs = st.executeQuery(sql2);
                rs.next();
                f.setNotResolve(rs.getInt(1));
                
                rs = st.executeQuery(sql3);
                rs.next();
                f.setTotalCustomer(rs.getInt(1));
                
                rs = st.executeQuery(sql4);
                rs.next();
                f.setAverageRating(Math.round(rs.getDouble(1)*100.0)/100.0);
                
                
                        
                
                listFeedback.add(f);
                   
                    
                rs.close();
                st.close();
                con.close();


            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listFeedback;
    }
       
    
    
}
