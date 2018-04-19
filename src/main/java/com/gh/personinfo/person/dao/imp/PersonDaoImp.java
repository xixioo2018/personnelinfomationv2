package com.gh.personinfo.person.dao.imp;

import com.gh.personinfo.other.dao.imp.BaseDaoImpl;
import com.gh.personinfo.person.dao.PersonDao;
import com.gh.personinfo.person.model.Person;
import org.springframework.stereotype.Repository;

@Repository
public class PersonDaoImp extends BaseDaoImpl<Person> implements PersonDao {
    public PersonDaoImp() {
        super.setNs("com.gh.personinfo.person.dao.PersonDao");
    }
}
