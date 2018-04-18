package com.gh.personinfo.user.controller;

import com.gh.personinfo.user.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class UserController {
    @Resource
    UserService userService;

    @RequestMapping("/testabc")
    public String testabc(){
        System.out.println("testabc");
        return "success.jsp";
    }
}
