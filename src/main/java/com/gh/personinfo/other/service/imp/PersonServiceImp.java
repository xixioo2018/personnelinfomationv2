package com.gh.personinfo.other.service.imp;

import com.gh.personinfo.other.dao.PersonDao;
import com.gh.personinfo.other.service.PersonService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PersonServiceImp implements PersonService {
    @Resource
    PersonDao personDao;
}
