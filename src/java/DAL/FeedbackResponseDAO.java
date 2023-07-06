/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Context.DBContext;
import Model.FeedbackResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
}
