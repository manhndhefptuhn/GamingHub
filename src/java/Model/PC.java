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
    private int productID;
    private int mainboardID;
    private int cpuID;
    private int ramID;
    private int vgaID;
    private int storageID;
    private int psuID;
    private int caseID;

    public PC() {
    }

    public PC(int productID, int mainboardID, int cpuID, int ramID, int vgaID, int storageID, int psuID, int caseID) {
        this.productID = productID;
        this.mainboardID = mainboardID;
        this.cpuID = cpuID;
        this.ramID = ramID;
        this.vgaID = vgaID;
        this.storageID = storageID;
        this.psuID = psuID;
        this.caseID = caseID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getMainboardID() {
        return mainboardID;
    }

    public void setMainboardID(int mainboardID) {
        this.mainboardID = mainboardID;
    }

    public int getCpuID() {
        return cpuID;
    }

    public void setCpuID(int cpuID) {
        this.cpuID = cpuID;
    }

    public int getRamID() {
        return ramID;
    }

    public void setRamID(int ramID) {
        this.ramID = ramID;
    }

    public int getVgaID() {
        return vgaID;
    }

    public void setVgaID(int vgaID) {
        this.vgaID = vgaID;
    }

    public int getStorageID() {
        return storageID;
    }

    public void setStorageID(int storageID) {
        this.storageID = storageID;
    }

    public int getPsuID() {
        return psuID;
    }

    public void setPsuID(int psuID) {
        this.psuID = psuID;
    }

    public int getCaseID() {
        return caseID;
    }

    public void setCaseID(int caseID) {
        this.caseID = caseID;
    }

    
    
    
}
