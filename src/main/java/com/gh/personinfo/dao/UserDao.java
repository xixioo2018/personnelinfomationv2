package com.gh.personinfo.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import com.gh.personinfo.model.User;
import org.mybatis.spring.annotation.MapperScan;

public interface UserDao extends BaseDao<User>{

}
