package com.gh.personinfo.user.dao.imp;

import com.gh.personinfo.user.dao.UserDao;
import com.gh.personinfo.user.model.User;
import com.gh.personinfo.other.dao.imp.BaseDaoImpl;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImp extends BaseDaoImpl<User> implements UserDao {
    public UserDaoImp() {
        super.setNs("com.gh.personinfo.dao.UserDao");
    }
}
