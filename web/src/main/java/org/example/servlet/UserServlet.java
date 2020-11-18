package org.example.servlet;

import org.example.pojo.User;
import org.example.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserServlet {
    static String config = "applicationContext.xml";

    @RequestMapping("/login.action")
    public ModelAndView login(User user) {
        ModelAndView ma = new ModelAndView();
        ApplicationContext ac = new ClassPathXmlApplicationContext(config);
        UserService us = (UserService) ac.getBean("userServiceImpl");
        List<User> login = us.login(user);
        int msg = 0;
        if (login.size() != 0) {
            msg = 1;
        }
        ma.addObject("msg", msg);
        ma.setViewName("successLogin");
        return ma;
    }
}
