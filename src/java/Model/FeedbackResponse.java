/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Zarius
 */
public class FeedbackResponse {
    private int responseID;
    private int feedbackID;
    private int userID;
    private String responseDate;
    private String responseContent;

    public FeedbackResponse() {
    }

    public FeedbackResponse(int responseID, int feedbackID, int userID, String responseDate, String responseContent) {
        this.responseID = responseID;
        this.feedbackID = feedbackID;
        this.userID = userID;
        this.responseDate = responseDate;
        this.responseContent = responseContent;
    }

    
    public int getResponseID() {
        return responseID;
    }

    public void setResponseID(int responseID) {
        this.responseID = responseID;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getResponseDate() {
        return responseDate;
    }

    public void setResponseDate(String responseDate) {
        this.responseDate = responseDate;
    }

    public String getResponseContent() {
        return responseContent;
    }

    public void setResponseContent(String responseContent) {
        this.responseContent = responseContent;
    }


}
