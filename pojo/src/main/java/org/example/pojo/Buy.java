package org.example.pojo;

public class Buy {
    private int id;
    private int goodid;
    private int amount;
    private double account;
    private int buyerid;

    public Buy() {
    }

    public Buy(int id, int goodid, int amount, double account, int buyerid) {
        this.id = id;
        this.goodid = goodid;
        this.amount = amount;
        this.account = account;
        this.buyerid = buyerid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGoodid() {
        return goodid;
    }

    public void setGoodid(int goodid) {
        this.goodid = goodid;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getAccount() {
        return account;
    }

    public void setAccount(double account) {
        this.account = account;
    }

    public int getBuyerid() {
        return buyerid;
    }

    public void setBuyerid(int buyerid) {
        this.buyerid = buyerid;
    }

    @Override
    public String toString() {
        return "Buy{" +
                "id=" + id +
                ", goodid=" + goodid +
                ", amount=" + amount +
                ", account=" + account +
                ", buyerid=" + buyerid +
                '}';
    }
}
