package com.gh.personinfo.emaillog.service.imp;

import com.gh.personinfo.emaillog.dao.EmaillogDao;
import com.gh.personinfo.emaillog.service.EmaillogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmaillogServiceImp implements EmaillogService {
    @Autowired
    EmaillogDao emaillogDao;
}
