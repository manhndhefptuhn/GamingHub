/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.FeedbackResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Zarius
 */
public class FeedbackResponseDAO {
    public Map<Integer, FeedbackResponse> getFeedbackResponse() {
        Map<Integer, FeedbackResponse> listResponse = new HashMap<>();
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "Select * FROM `feedback_response`";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    FeedbackResponse fbrsp = new FeedbackResponse();
                    fbrsp.setResponseID(rs.getInt(1));
                    fbrsp.setFeedbackID(rs.getInt(2));
                    fbrsp.setUserID(rs.getInt(3));
                    fbrsp.setResponseDate(rs.getString(4));
                    fbrsp.setResponseContent(rs.getString(5));
                    listResponse.put(fbrsp.getFeedbackID(), fbrsp);
                }
                rs.close();
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listResponse;
    }
    
    public ArrayList<FeedbackResponse> getFeedbackRespones() {
        ArrayList<FeedbackResponse> list = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `feedback_response`;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    FeedbackResponse f = new FeedbackResponse();
                    f.setResponseID(rs.getInt(1));
                    f.setFeedbackID(rs.getInt(2));
                    f.setUserID(rs.getInt(3));
                    f.setResponseDate(rs.getString(4));
                    f.setResponseContent(rs.getString(5));

                    list.add(f);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
     public void SetResponse(int feedbackId, int userId, String content) {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String sql = "INSERT INTO `feedback_response` (`Feedback_ID`, `User_ID`, `Response_date`,`Response_content`) VALUES (?,?,?,?)";
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            //feedback
            st.setInt(1, feedbackId);
            //user
            st.setInt(2, userId);
            //date
            st.setTimestamp(3, timestamp);
            //content
            st.setString(4, content);
            st.executeUpdate();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
     
             //detele response (run successfully)
        public void deleteFeedbackReply(int feedbackResId){
            try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                int rowsAffected = st.executeUpdate("delete from `feedback_response` where `Response_ID` = "+feedbackResId+";");
            
                if (rowsAffected > 0) {
                    System.out.println("Row deleted successfully.");
                } else {
                    System.out.println("No rows were deleted.");
                }
                
                st.close();
                con.close();
            }

            } catch (Exception e) {
            System.out.println(e.getMessage());
            }

        }
        
        
            //return response with response id
    public ArrayList<FeedbackResponse> getFeedbackReplyWithId(String feedbackId) {
        ArrayList<FeedbackResponse> list = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `feedback_response` WHERE Feedback_ID = "+feedbackId+";";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    FeedbackResponse f = new FeedbackResponse();
                    f.setResponseID(rs.getInt(1));
                    f.setFeedbackID(rs.getInt(2));
                    f.setUserID(rs.getInt(3));
                    f.setResponseDate(rs.getString(4));
                    f.setResponseContent(rs.getString(5));

                    list.add(f);
                }
                rs.close();
                st.close();
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
}
