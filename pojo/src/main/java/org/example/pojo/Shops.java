package org.example.pojo;

import java.io.Serializable;
import java.util.List;

public class Shops implements Serializable {
    private List<Shop> shops;

    public List<Shop> getShops() {
        return shops;
    }

    public void setShops(List<Shop> shops) {
        this.shops = shops;
    }

}
