package com.gh.personinfo.dao.imp;

import com.gh.personinfo.dao.UserDao;
import com.gh.personinfo.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImp extends BaseDaoImpl<User> implements UserDao {
    public UserDaoImp() {
        super.setNs("com.gh.personinfo.dao.UserDao");
    }
}
