package com.gh.personinfo.emaillog.controller;

import com.gh.personinfo.emaillog.model.Emaillog;
import com.gh.personinfo.emaillog.service.EmaillogService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class EmaillogController {
    @Resource
    EmaillogService eaillogService;
}
