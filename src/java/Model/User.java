/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;


/**
 *
 * @author Zarius
 */
public class User {
    private int User_ID;
    private String FullName;
    private String Email;
    private String Password;
    private String Profile_picture;
    private String Phone_Number;
    private String Address;
    private boolean Status;
    private int Role_ID;

    public User() {
    }
    
    public User(int id, String fullName, String email, String phone_number, boolean status) {
        this.User_ID = id;
        this.FullName = fullName;
        this.Email = email;
        this.Phone_Number = phone_number;
        this.Status = status;
    }

    public User(int User_ID, String FullName, String Email, String Password, String Profile_picture, String Phone_Number, String Address, boolean Status, int Role_ID) {
        this.User_ID = User_ID;
        this.FullName = FullName;
        this.Email = Email;
        this.Password = Password;
        this.Profile_picture = Profile_picture;
        this.Phone_Number = Phone_Number;
        this.Address = Address;
        this.Status = Status;
        this.Role_ID = Role_ID;
    }

    public int getUser_ID() {
        return User_ID;
    }

    public void setUser_ID(int User_ID) {
        this.User_ID = User_ID;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getProfile_picture() {
        return Profile_picture;
    }

    public void setProfile_picture(String Profile_picture) {
        this.Profile_picture = Profile_picture;
    }

    public String getPhone_Number() {
        return Phone_Number;
    }

    public void setPhone_Number(String Phone_Number) {
        this.Phone_Number = Phone_Number;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    public int getRole_ID() {
        return Role_ID;
    }

    public void setRole_ID(int Role_ID) {
        this.Role_ID = Role_ID;
    }
    
    
}
