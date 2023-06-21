/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Zarius
 */
public class Product_Images {
    private int productImagesID;
    private int productID;
    private String images;

    public Product_Images() {
    }

    public Product_Images(int productImagesID, int productID, String images) {
        this.productImagesID = productImagesID;
        this.productID = productID;
        this.images = images;
    }

    public int getProductImagesID() {
        return productImagesID;
    }

    public void setProductImagesID(int productImagesID) {
        this.productImagesID = productImagesID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
    
    
}
