/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Zarius
 */
public class Roles {
    private int Role_ID;
    private String Role_name;

    public Roles() {
    }

    public Roles(int Role_ID, String Role_name) {
        this.Role_ID = Role_ID;
        this.Role_name = Role_name;
    }

    public int getRole_ID() {
        return Role_ID;
    }

    public void setRole_ID(int Role_ID) {
        this.Role_ID = Role_ID;
    }

    public String getRole_name() {
        return Role_name;
    }

    public void setRole_name(String Role_name) {
        this.Role_name = Role_name;
    }

    
}
