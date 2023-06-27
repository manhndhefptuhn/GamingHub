/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class FeedbackReply {
    int responseId;
    int feedbackId;
    int userId;
    Date responseDate;
    String responseContent;

    public FeedbackReply(int responseId, int feedbackId, int userId, Date responseDate, String responseContent) {
        this.responseId = responseId;
        this.feedbackId = feedbackId;
        this.userId = userId;
        this.responseDate = responseDate;
        this.responseContent = responseContent;
    }

    public FeedbackReply(){}
    
    public int getResponseId() {
        return responseId;
    }

    public void setResponseId(int responseId) {
        this.responseId = responseId;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getResponseDate() {
        return responseDate;
    }

    public void setResponseDate(Date responseDate) {
        this.responseDate = responseDate;
    }

    public String getResponseContent() {
        return responseContent;
    }

    public void setResponseContent(String responseContent) {
        this.responseContent = responseContent;
    }
    
    
    
}
