package com.gh.personinfo.service.imp;

import com.gh.personinfo.dao.PersonDao;
import com.gh.personinfo.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PersonServiceImp implements PersonService {
    @Resource
    PersonDao personDao;
}
