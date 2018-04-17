package com.gh.personinfo.controller;

import com.gh.personinfo.service.PersonService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class PersonController {
    @Resource
    PersonService personService;
}
