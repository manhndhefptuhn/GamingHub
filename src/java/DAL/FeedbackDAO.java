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
import Model.User;
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
    
//    //Get feedback via feedback name   
//    public ArrayList<Feedback> getFeedbackWithName(String feedbackName) {
//        ArrayList<Feedback> listFeedback = new ArrayList<>();
//        try {
//            DBContext db = new DBContext();
//            Connection con = db.getConnection();
//            if (con != null) {
//                Statement st = con.createStatement();
//                String sql = "select * from `feedback` where `Feedback_Name` like '%" +feedbackName+ "%';";
//                ResultSet rs = st.executeQuery(sql);
//                while (rs.next()) {
//                    Feedback f = new Feedback();
//                    f.setFeedbackId(rs.getInt(1));
//                    f.setUserId(rs.getInt(2));
//                    f.setProductId(rs.getInt(3));
//                    f.setCreateDate(rs.getDate(4));
//                    f.setContent(rs.getString(5));
//                    f.setImage(rs.getString(6));
//                    f.setRating(rs.getDouble(7));
//                    f.setStatus(rs.getBoolean(8));
//                    listFeedback.add(f);
//                }
//                rs.close();
//                st.close();
//                con.close();
//            }
//
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//        }
//        return listFeedback;
//    }
    
    
    //dummy method
    public ArrayList<Feedback> getFeedbackWithName(String feedbackName) {
        ArrayList<Feedback> listFeedback = new ArrayList<>();
        Feedback fb;
        
        fb = new Feedback(5,5,5,null,"good","good",4.5, true);
        listFeedback.add(fb);
                
        return listFeedback;

    }
  
    
    
}
