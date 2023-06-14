/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Zarius
 */
public class PC {
    private int product_ID;
    private int mainboard_ID;
    private int cpu_ID;
    private int ram_ID;
    private int vga_ID;
    private int storage_ID;
    private int psu_ID;
    private int case_ID;

    public PC() {
    }

    public PC(int product_ID, int mainboard_ID, int cpu_ID, int ram_ID, int vga_ID, int storage_ID, int psu_ID, int case_ID) {
        this.product_ID = product_ID;
        this.mainboard_ID = mainboard_ID;
        this.cpu_ID = cpu_ID;
        this.ram_ID = ram_ID;
        this.vga_ID = vga_ID;
        this.storage_ID = storage_ID;
        this.psu_ID = psu_ID;
        this.case_ID = case_ID;
    }

    public int getProduct_ID() {
        return product_ID;
    }

    public void setProduct_ID(int product_ID) {
        this.product_ID = product_ID;
    }

    public int getMainboard_ID() {
        return mainboard_ID;
    }

    public void setMainboard_ID(int mainboard_ID) {
        this.mainboard_ID = mainboard_ID;
    }

    public int getCpu_ID() {
        return cpu_ID;
    }

    public void setCpu_ID(int cpu_ID) {
        this.cpu_ID = cpu_ID;
    }

    public int getRam_ID() {
        return ram_ID;
    }

    public void setRam_ID(int ram_ID) {
        this.ram_ID = ram_ID;
    }

    public int getVga_ID() {
        return vga_ID;
    }

    public void setVga_ID(int vga_ID) {
        this.vga_ID = vga_ID;
    }

    public int getStorage_ID() {
        return storage_ID;
    }

    public void setStorage_ID(int storage_ID) {
        this.storage_ID = storage_ID;
    }

    public int getPsu_ID() {
        return psu_ID;
    }

    public void setPsu_ID(int psu_ID) {
        this.psu_ID = psu_ID;
    }

    public int getCase_ID() {
        return case_ID;
    }

    public void setCase_ID(int case_ID) {
        this.case_ID = case_ID;
    }
    
    
}
