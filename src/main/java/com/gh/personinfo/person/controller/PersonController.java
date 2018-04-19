package com.gh.personinfo.person.controller;

import com.gh.personinfo.person.service.PersonService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class PersonController {
    @Resource
    PersonService personService;
}
