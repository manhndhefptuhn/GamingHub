/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author Zarius
 */
public class Order {
    private int orderID;
    private int userID;
    private String fullName;
    private String address;
    private String country;
    private int postCode;
    private String phoneNumber;
    private Timestamp orderDate;
    private int totalCost;
    private String payment;
    private int saleID;
    private int orderStatus;
    private String note;

    public Order() {
    }

    public Order(int orderID, int userID, String fullName, String address, String country, int postCode, String phoneNumber, Timestamp orderDate, int totalCost, String payment, int saleID, int orderStatus, String note) {
        this.orderID = orderID;
        this.userID = userID;
        this.fullName = fullName;
        this.address = address;
        this.country = country;
        this.postCode = postCode;
        this.phoneNumber = phoneNumber;
        this.orderDate = orderDate;
        this.totalCost = totalCost;
        this.payment = payment;
        this.saleID = saleID;
        this.orderStatus = orderStatus;
        this.note = note;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public int getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(int totalCost) {
        this.totalCost = totalCost;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public int getSaleID() {
        return saleID;
    }

    public void setSaleID(int saleID) {
        this.saleID = saleID;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getPostCode() {
        return postCode;
    }

    public void setPostCode(int postCode) {
        this.postCode = postCode;
    }
    
    
}
