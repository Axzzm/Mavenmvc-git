package org.example.pojo;


import java.io.Serializable;

public class Shop implements Serializable {
    private int id;
    private String goodname;
    private double price;
    private int amount;
    private String photourl;

    public Shop() {
    }

    public Shop(int id, String goodname, double price, int amount, String photourl) {
        this.id = id;
        this.goodname = goodname;
        this.price = price;
        this.amount = amount;
        this.photourl = photourl;
    }

    public String getPhotourl() {
        return photourl;
    }

    public void setPhotourl(String photourl) {
        this.photourl = photourl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGoodname() {
        return goodname;
    }

    public void setGoodname(String goodname) {
        this.goodname = goodname;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Shop{" +
                "id=" + id +
                ", goodname='" + goodname + '\'' +
                ", price=" + price +
                ", amount=" + amount +
                ", photourl='" + photourl + '\'' +
                '}';
    }
}
