/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Tien Dat
 */
public class ProductStatus {

    private int productStatusID;
    private String productStatusName;
    private boolean status;

    public int getProductStatusID() {
        return productStatusID;
    }

    public void setProductStatusID(int productStatusID) {
        this.productStatusID = productStatusID;
    }

    public String getProductStatusName() {
        return productStatusName;
    }

    public void setProductStatusName(String productStatusName) {
        this.productStatusName = productStatusName;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
