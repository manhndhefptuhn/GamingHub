/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Zarius
 */
public class VGA {
    private int vgaID;
    private String vgaName;
    private int price;
    private String description;
    private String image;
    private boolean status;

    public VGA() {
    }

    public VGA(int vgaID, String vgaName, int price, String description, String image, boolean status) {
        this.vgaID = vgaID;
        this.vgaName = vgaName;
        this.price = price;
        this.description = description;
        this.image = image;
        this.status = status;
    }


    public int getVgaID() {
        return vgaID;
    }

    public void setVgaID(int vgaID) {
        this.vgaID = vgaID;
    }

    public String getVgaName() {
        return vgaName;
    }

    public void setVgaName(String vgaName) {
        this.vgaName = vgaName;
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
