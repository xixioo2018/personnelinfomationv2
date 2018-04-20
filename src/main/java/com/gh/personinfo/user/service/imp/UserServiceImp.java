package com.gh.personinfo.user.service.imp;

import com.gh.personinfo.user.dao.UserDao;
import com.gh.personinfo.user.model.User;
import com.gh.personinfo.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    UserDao userDao;

    public List<User> find(Map map) {
        return userDao.find(map);
    }
}
