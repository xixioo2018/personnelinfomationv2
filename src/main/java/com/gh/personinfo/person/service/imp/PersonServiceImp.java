package com.gh.personinfo.person.service.imp;

import com.gh.personinfo.person.dao.PersonDao;
import com.gh.personinfo.person.model.Person;
import com.gh.personinfo.person.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonServiceImp implements PersonService {
    @Autowired
    PersonDao personDao;

    public int addPerson(Person person) {
        personDao.insert(person);
        return 0;
    }
}
