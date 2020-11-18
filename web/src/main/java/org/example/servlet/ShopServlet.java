package org.example.servlet;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import org.example.pojo.Shop;
import org.example.service.ShopService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/shop")
public class ShopServlet {
    static String config = "applicationContext.xml";

    @RequestMapping(value = "/shopQuery.action", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String doQueryShop(String page, String limit) throws JsonProcessingException {
        int pageNo = Integer.parseInt(page);
        int pageSize = Integer.parseInt(limit);
        ApplicationContext ac = new ClassPathXmlApplicationContext(config);
        ShopService ss = (ShopService) ac.getBean("shopServiceImpl");
        int count = ss.count();
        PageHelper.startPage(pageNo, pageSize);
        List<Shop> list = ss.query();
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", list);
        ObjectMapper om = new ObjectMapper();
        return om.writeValueAsString(map);
    }

    @RequestMapping(value = "/shopSearch.action", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String doSearchShop(Shop shop, String page, String limit) throws JsonProcessingException {
        int pageNo = Integer.parseInt(page);
        int pageSize = Integer.parseInt(limit);
        ApplicationContext ac = new ClassPathXmlApplicationContext(config);
        ShopService ss = (ShopService) ac.getBean("shopServiceImpl");
        System.out.println(shop.getGoodname());
        int count = ss.searchCount(shop);
        PageHelper.startPage(pageNo, pageSize);
        List<Shop> list = ss.search(shop);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", list);
        ObjectMapper om = new ObjectMapper();
        return om.writeValueAsString(map);
    }

    @RequestMapping(value = "/shopDelete.action", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String doDeleteShop(Shop shop) throws JsonProcessingException {
        ApplicationContext ac = new ClassPathXmlApplicationContext(config);
        ShopService ss = (ShopService) ac.getBean("shopServiceImpl");
        int pd = ss.deleteShop(shop);
        String msg = "删除失败!!";
        if (pd != 0) {
            msg = "删除成功!!";
        }
        return msg;
    }

    @RequestMapping(value = "/shopUpdate.action", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String doUpdateShop(Shop shop) throws JsonProcessingException {
        ApplicationContext ac = new ClassPathXmlApplicationContext(config);
        ShopService ss = (ShopService) ac.getBean("shopServiceImpl");
        int pd = ss.updateShop(shop);
        String msg = "修改失败!!";
        if (pd != 0) {
            msg = "修改成功!!";
        }
        return msg;
    }

    @RequestMapping(value = "/shopAdd.action", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String doAddShop(String caozuo, String page, String limit) throws JsonProcessingException {
        int pageNo = Integer.parseInt(page);
        int pageSize = Integer.parseInt(limit);
        ApplicationContext ac = new ClassPathXmlApplicationContext(config);
        ShopService ss = (ShopService) ac.getBean("shopServiceImpl");
        int count = ss.count();
        int lastPage = 0;
        if (count % pageSize != 0) {
            lastPage = count / pageSize + 1;
        } else {
            lastPage = count / pageSize;
        }
        String msg = "添加失败!!";
        if (caozuo.equals("新建数据")) {
            int pd = ss.addShop();
            if (pd != 0) {
                msg = "添加成功!!";
            }
        }
        System.out.println("lastPage=" + lastPage);
        PageHelper.startPage(lastPage, pageSize);
        List<Shop> list = ss.query();
        System.out.println("list=" + list);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", msg);
        map.put("lastPage", lastPage);
        map.put("count", count);
        map.put("data", list);
        ObjectMapper om = new ObjectMapper();
        return om.writeValueAsString(map);
    }

    @RequestMapping(value = "/shopDeleteAll.action", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String doDeleteAllShop(@RequestBody List<Shop> shops) throws JsonProcessingException {
        ApplicationContext ac = new ClassPathXmlApplicationContext(config);
        ShopService ss = (ShopService) ac.getBean("shopServiceImpl");
        List<Integer> list = new ArrayList<>();
        for (Shop shop : shops) {
            int i = ss.deleteAll(shop);
            list.add(i);
        }
        String msg = "删除失败!!";
        if (shops.size() == 0) {
            msg = "请选择要删除的数据!!";
        } else if (list.size() == shops.size()) {
            msg = "删除成功!!";
        }
        return msg;
    }

    @RequestMapping(value = "/fileupload.action", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String doFileUpload(@RequestParam("file") MultipartFile file, String id) throws IOException {
        //String path =request.getSession().getServletContext().getRealPath("image")+"\\";
        Shop shop = new Shop();
        String path = "D:\\IntelliJ IDEA 2019.3.3\\SpringMVC\\web\\image";
        //String path="D:\\image";
        String fileName = file.getOriginalFilename();
        System.out.println("file=" + file);
        System.out.println("path=" + path);
        System.out.println("文件名称=" + fileName);
        File file1 = new File(path);
        //判断该路径是否存在,如果不存在就新建
        if (!file1.exists()) {
            file1.mkdirs();
        }
        fileName = fileName.substring(0, fileName.lastIndexOf(".")) + System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
        System.out.println("新文件名称=" + fileName);
        shop.setPhotourl(fileName);
        shop.setId(Integer.parseInt(id));
        ApplicationContext ac = new ClassPathXmlApplicationContext(config);
        ShopService ss = (ShopService) ac.getBean("shopServiceImpl");
        ss.addPhoto(shop);
        File newFile = new File(file1, fileName);
        file.transferTo(newFile);
        return "66666";
    }
}
