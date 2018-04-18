package com.gh.personinfo.other.controller;

import com.gh.personinfo.other.service.PersonService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class PersonController {
    @Resource
    PersonService personService;
}
