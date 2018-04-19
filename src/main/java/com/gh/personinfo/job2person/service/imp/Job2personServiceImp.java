package com.gh.personinfo.job2person.service.imp;

import com.gh.personinfo.job2person.dao.Job2personDao;
import com.gh.personinfo.job2person.service.Job2personService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Job2personServiceImp implements Job2personService {
    @Autowired
    Job2personDao job2personDao;
}
