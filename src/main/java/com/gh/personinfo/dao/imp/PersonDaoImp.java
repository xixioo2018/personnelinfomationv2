package com.gh.personinfo.dao.imp;

import com.gh.personinfo.dao.PersonDao;
import com.gh.personinfo.model.Person;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PersonDaoImp extends BaseDaoImpl<Person> implements PersonDao {
    public PersonDaoImp() {
        super.setNs("com.gh.personinfo.dao.PersonDao");
    }
}
