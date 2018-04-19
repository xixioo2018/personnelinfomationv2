package com.gh.personinfo.dicttype.controller;

import com.gh.personinfo.dicttype.service.DicTypeService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class DictTypeController {
    @Resource
    DicTypeService dicTypeService;
}
