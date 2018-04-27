package com.gh.personinfo.person.dao.imp;

import com.gh.personinfo.other.dao.imp.BaseDaoImpl;
import com.gh.personinfo.person.dao.PersonDao;
import com.gh.personinfo.person.model.Person;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class PersonDaoImp extends BaseDaoImpl<Person> implements PersonDao {
    public PersonDaoImp() {
        super.setNs("com.gh.personinfo.person.dao.PersonDao");
    }

    public List<Person> match(Map map) {
        List<Person> personList = this.getSqlSession().selectList("com.gh.personinfo.person.dao.PersonDao" + ".match", map);
        return personList;
    }
}
