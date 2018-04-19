package com.gh.personinfo.dict.controller;

import com.gh.personinfo.dict.service.DictService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class DictController {
    @Resource
    DictService dictService;
}
