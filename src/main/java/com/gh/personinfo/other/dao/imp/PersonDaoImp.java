package com.gh.personinfo.other.dao.imp;

import com.gh.personinfo.other.dao.PersonDao;
import com.gh.personinfo.other.model.Person;
import org.springframework.stereotype.Repository;

@Repository
public class PersonDaoImp extends BaseDaoImpl<Person> implements PersonDao {
    public PersonDaoImp() {
        super.setNs("com.gh.personinfo.dao.PersonDao");
    }
}
