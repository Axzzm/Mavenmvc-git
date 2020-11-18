package org.example.service.Impl;

import org.example.dao.ShopDao;
import org.example.pojo.Shop;
import org.example.service.ShopService;

import java.util.List;

public class ShopServiceImpl implements ShopService {
    private ShopDao sd;

    public void setSd(ShopDao sd) {
        this.sd = sd;
    }

    @Override
    public List<Shop> query() {
        return sd.query();
    }

    @Override
    public int count() {
        return sd.count();
    }

    @Override
    public List<Shop> search(Shop shop) {
        return sd.search(shop);
    }

    @Override
    public int searchCount(Shop shop) {
        return sd.searchCount(shop);
    }

    @Override
    public int deleteShop(Shop shop) {
        return sd.deleteShop(shop);
    }

    @Override
    public int updateShop(Shop shop) {
        return sd.updateShop(shop);
    }

    @Override
    public int addShop() {
        return sd.addShop();
    }

    @Override
    public int deleteAll(Shop shops) {
        return sd.deleteShop(shops);
    }

    @Override
    public int addPhoto(Shop shop) {
        return sd.addPhoto(shop);
    }
}
