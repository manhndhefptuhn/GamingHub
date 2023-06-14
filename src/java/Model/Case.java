/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Zarius
 */
public class Case {
    private int caseID;
    private String caseName;
    private int price;
    private String description;
    private String image;
    private int component_ID;

    public Case() {
    }

    public Case(int caseID, String caseName, int price, String description, String image, int component_ID) {
        this.caseID = caseID;
        this.caseName = caseName;
        this.price = price;
        this.description = description;
        this.image = image;
        this.component_ID = component_ID;
    }

    public int getCaseID() {
        return caseID;
    }

    public void setCaseID(int caseID) {
        this.caseID = caseID;
    }

    public String getCaseName() {
        return caseName;
    }

    public void setCaseName(String caseName) {
        this.caseName = caseName;
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

    public int getComponent_ID() {
        return component_ID;
    }

    public void setComponent_ID(int component_ID) {
        this.component_ID = component_ID;
    }
    
}
