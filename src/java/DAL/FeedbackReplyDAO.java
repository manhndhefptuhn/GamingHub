/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.FeedbackReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;


/**
 *
 * @author admin
 */
public class FeedbackReplyDAO {
    //return response list
    public ArrayList<FeedbackReply> getFeedbackReply() {
        ArrayList<FeedbackReply> list = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "select * from `feedback_response`;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    FeedbackReply f = new FeedbackReply();
                    f.setResponseId(rs.getInt(1));
                    f.setFeedbackId(rs.getInt(2));
                    f.setUserId(rs.getInt(3));
                    f.setResponseDate(rs.getDate(4));
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
    
    
    
    //return response with response id
    public ArrayList<FeedbackReply> getFeedbackReplyWithId(String feedbackId) {
        ArrayList<FeedbackReply> list = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `feedback_response` WHERE Feedback_ID = "+feedbackId+";";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    FeedbackReply f = new FeedbackReply();
                    f.setResponseId(rs.getInt(1));
                    f.setFeedbackId(rs.getInt(2));
                    f.setUserId(rs.getInt(3));
                    f.setResponseDate(rs.getDate(4));
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
    
    
    
    public FeedbackReply getReply(int feedbackId) {
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "SELECT * FROM `feedback_response` WHERE Feedback_ID = "+feedbackId+";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    FeedbackReply fbr = new FeedbackReply();
                    fbr.setResponseId(rs.getInt(1));
                    fbr.setFeedbackId(rs.getInt(2));
                    fbr.setUserId(rs.getInt(3));
                    fbr.setResponseDate(rs.getDate(4));
                    fbr.setResponseContent(rs.getString(5));
                    return fbr;
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
    
    //edit response (need fixing)
    public void editFeedbackReply(int feedbackResId, String newContent){       
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                String sql = "UPDATE `feedback_response`\n" +
                                "SET `Response_content` = `"+newContent+"`\n" +
                                "WHERE `Response_ID` = "+feedbackResId+";";
                ResultSet rs = st.executeQuery(sql);

                rs.close();
                st.close();
                con.close();
            }

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
    
        
        
        
        
        
        public void SetResponse(int feedbackId, int userId, String content) {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String sql = "INSERT INTO `feedback_response` (`Feedback_ID`, `User_ID`, `Response_date`,`Response_content`) VALUES (?,?,?,?)";
        String sql2 = "update `feedback` set Status = 1 where Feedback_ID = " +feedbackId+ ";";
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
            
            st = con.prepareStatement(sql2);
            st.executeUpdate();
            
                    
                       
            
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }


        
    }
    
}
