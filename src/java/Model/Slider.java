/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Zarius
 */
public class Slider {
    private int sliderID;
    private String sliderTitle;
    private String sliderImage;
    private String backlink;
    private String note;
    private boolean status;

    public Slider() {
    }

    public Slider(int sliderID, String sliderTitle, String sliderImage, String backlink, String note, boolean status) {
        this.sliderID = sliderID;
        this.sliderTitle = sliderTitle;
        this.sliderImage = sliderImage;
        this.backlink = backlink;
        this.note = note;
        this.status = status;
    }

    public int getSliderID() {
        return sliderID;
    }

    public void setSliderID(int sliderID) {
        this.sliderID = sliderID;
    }

    public String getSliderTitle() {
        return sliderTitle;
    }

    public void setSliderTitle(String sliderTitle) {
        this.sliderTitle = sliderTitle;
    }

    public String getSliderImage() {
        return sliderImage;
    }

    public void setSliderImage(String sliderImage) {
        this.sliderImage = sliderImage;
    }
    
    public String getBacklink() {
        return backlink;
    }

    public void setBacklink(String backlink) {
        this.backlink = backlink;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    
}
