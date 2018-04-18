package com.gh.personinfo.user.service.imp;

import com.gh.personinfo.user.dao.UserDao;
import com.gh.personinfo.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    UserDao userDao;

}
