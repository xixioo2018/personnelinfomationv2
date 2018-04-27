package com.gh.personinfo.person.dao;

import com.gh.personinfo.other.dao.BaseDao;
import com.gh.personinfo.person.model.Person;

import java.util.List;
import java.util.Map;

public interface PersonDao extends BaseDao<Person> {

    List<Person> match(Map map);
}
