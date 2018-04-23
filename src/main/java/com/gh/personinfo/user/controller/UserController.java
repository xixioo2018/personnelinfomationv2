package com.gh.personinfo.user.controller;

import com.gh.personinfo.user.model.User;
import com.gh.personinfo.user.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
public class UserController {
    @Resource
    UserService userService;

    @RequestMapping("toLogin.action")
    public String toLogin(){
        return "/home.jsp";//转向登录页面
    }

    @RequestMapping("/user-login")
    public String login(User user, Model model, HttpServletRequest request, HttpServletResponse response){
        Map<String,String> map = new HashMap<String,String>();
        map.put("username", user.getUsername());
        map.put("password", user.getPassword());
        List<User> userList = userService.find(map);
        if(userList!=null&&userList.size()>0){
            System.out.println(userList.get(0).toString());
            request.getSession().setAttribute("user", userList.get(0));
            return "/home.jsp";//转向主页
        }
        System.out.println(user.toString());
        return "/success.jsp";
    }
}
