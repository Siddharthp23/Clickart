package com.entity;

public class user {
private int id;
private String name;
private String email;
private String password;
private String phoneno;
private String address;
private String landmark;
private String city;
private String state;
private String pincode;

    public user() {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phoneno = phoneno;
        this.address = address;
        this.landmark = landmark;
        this.city = city;
        this.state = state;
        this.pincode = pincode;
    }

    

    

    @Override
    public String toString() {
        return "user{" + "id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", phoneno=" + phoneno + ", address=" + address + ", landmark=" + landmark + ", city=" + city + ", state=" + state + ", pincode=" + pincode + '}';
    }


    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLandmark() {
        return landmark;
    }

    public void setLandmark(String landmark) {
        this.landmark = landmark;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }



}
