package com.entity;

public class Item_Order {
    private int id;
    private String orderId;
    private String username;
    private String email;
    private String phno;
    private String fulladd;
    private String I_name;
    private String brand;
    private String price;
    private String paymentType;
     
    public Item_Order() {
        super();
    }

    public String getI_name() {
        return I_name;
    }

    public void setI_name(String I_name) {
        this.I_name = I_name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
    
    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhno() {
        return phno;
    }

    public void setPhno(String phno) {
        this.phno = phno;
    }

    public String getFulladd() {
        return fulladd;
    }

    public void setFulladd(String fulladd) {
        this.fulladd = fulladd;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    @Override
    public String toString() {
        return "Item_Order{" + "id=" + id + ", orderId=" + orderId + ", username=" + username + ", email=" + email + ", phno=" + phno + ", fulladd=" + fulladd + ", paymentType=" + paymentType + '}';
    }

    
    
    
}
