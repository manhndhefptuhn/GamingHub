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
    private String description;
    private String image;
    private boolean status;

    public PSU() {
    }

    public PSU(int psuID, String psuName, int price, String description, String image, boolean status) {
        this.psuID = psuID;
        this.psuName = psuName;
        this.price = price;
        this.description = description;
        this.image = image;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    
}
