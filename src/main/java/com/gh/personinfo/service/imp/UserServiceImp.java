package com.gh.personinfo.service.imp;

import com.gh.personinfo.dao.UserDao;
import com.gh.personinfo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    UserDao userDao;

}
