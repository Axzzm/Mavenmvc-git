package org.example.dao;

import org.example.pojo.Shop;

import java.util.List;

public interface ShopDao {
    List<Shop> query();

    int count();

    List<Shop> search(Shop shop);

    int searchCount(Shop shop);

    int deleteShop(Shop shop);

    int updateShop(Shop shop);

    int addShop();

    int deleteAll(Shop shop);

    int addPhoto(Shop shop);
}
