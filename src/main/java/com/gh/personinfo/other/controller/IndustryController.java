package com.gh.personinfo.other.controller;

import com.gh.personinfo.other.service.IndustryService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class IndustryController {
    @Resource
    IndustryService industryService;
}
