/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author Zarius
 */
public class PasswordReset {
    private int resetID;
    private int userID;
    private String resetPassword;
    private Timestamp timeCreated;

    public PasswordReset(int resetID, int userID, String resetPassword, Timestamp timeCreated) {
        this.resetID = resetID;
        this.userID = userID;
        this.resetPassword = resetPassword;
        this.timeCreated = timeCreated;
    }

    public PasswordReset() {
    }

    public int getResetID() {
        return resetID;
    }

    public void setResetID(int resetID) {
        this.resetID = resetID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getResetPassword() {
        return resetPassword;
    }

    public void setResetPassword(String resetPassword) {
        this.resetPassword = resetPassword;
    }

    public Timestamp getTimeCreated() {
        return timeCreated;
    }

    public void setTimeCreated(Timestamp timeCreated) {
        this.timeCreated = timeCreated;
    }
    
    
}
