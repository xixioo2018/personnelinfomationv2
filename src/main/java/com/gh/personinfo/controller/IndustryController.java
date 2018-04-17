package com.gh.personinfo.controller;

import com.gh.personinfo.service.IndustryService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class IndustryController {
    @Resource
    IndustryService industryService;
}
