/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class FeedbackDashboard {
    int totalFeedback;
    int notResolve;
    int totalCustomer;
    double averageRating;

    public FeedbackDashboard(int totalFeedback, int notResolve, int totalCustomer, double averageRating) {
        this.totalFeedback = totalFeedback;
        this.notResolve = notResolve;
        this.totalCustomer = totalCustomer;
        this.averageRating = averageRating;
    }
    
    public FeedbackDashboard(){}

    public int getTotalFeedback() {
        return totalFeedback;
    }

    public void setTotalFeedback(int totalFeedback) {
        this.totalFeedback = totalFeedback;
    }

    public int getNotResolve() {
        return notResolve;
    }

    public void setNotResolve(int notResolve) {
        this.notResolve = notResolve;
    }

    public int getTotalCustomer() {
        return totalCustomer;
    }

    public void setTotalCustomer(int totalCustomer) {
        this.totalCustomer = totalCustomer;
    }

    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }
    
    
}
