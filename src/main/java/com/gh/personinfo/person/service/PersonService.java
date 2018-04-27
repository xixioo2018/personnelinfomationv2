package com.gh.personinfo.person.service;

import com.gh.personinfo.person.model.Person;

import java.util.List;
import java.util.Map;

public interface PersonService {
    public int addPerson(Person person);

    public List<Person> queryperson(Map<String,Object> map);

    public Map<String,Object> deal(String serch);

    List<Person> matchPerson(int jobtype, int jobid);

    public void updatePersonById(Person person);
}
