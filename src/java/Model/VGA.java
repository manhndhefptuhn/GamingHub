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
    private boolean status;

    public VGA() {
    }

    public VGA(int vgaID, String vgaName, int price, boolean status) {
        this.vgaID = vgaID;
        this.vgaName = vgaName;
        this.price = price;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    
}
