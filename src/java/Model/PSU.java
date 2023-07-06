/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Zarius
 */
public class PSU {
    private int psuID;
    private String psuName;
    private int price;
    private boolean status;

    public PSU() {
    }

    public PSU(int psuID, String psuName, int price, boolean status) {
        this.psuID = psuID;
        this.psuName = psuName;
        this.price = price;
        this.status = status;
    }


    public int getPsuID() {
        return psuID;
    }

    public void setPsuID(int psuID) {
        this.psuID = psuID;
    }

    public String getPsuName() {
        return psuName;
    }

    public void setPsuName(String psuName) {
        this.psuName = psuName;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPrice() {
        return price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    
}
