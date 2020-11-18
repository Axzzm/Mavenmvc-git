package org.example.service.Impl;

import org.example.dao.UserDao;
import org.example.pojo.User;
import org.example.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao ud;

    public void setUd(UserDao ud) {
        this.ud = ud;
    }

    @Override
    public List<User> login(User user) {
        return ud.login(user);
    }
}
