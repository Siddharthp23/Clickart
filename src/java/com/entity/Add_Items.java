package com.entity;
public class Add_Items {
private int id;
private String name;
private String brand_name;
private String price;
private String category;
private String status;
private String photo;


    public Add_Items() {
        this.name = name;
        this.brand_name = brand_name;
        this.price = price;
        this.category = category;
        this.status= status;
        this.photo = photo;
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

    public String getBrand_name() {
        return brand_name;
    }

    public void setBrand_name(String brand_name) {
        this.brand_name = brand_name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Add_Items{" + "id=" + id + ", name=" + name + ", brand_name=" + brand_name + ", price=" + price + ", category=" + category + ", status=" + status + ", photo=" + photo + '}';
    }




}
