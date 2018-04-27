package com.gh.personinfo.job2person.service;

import com.gh.personinfo.job2person.model.Job2person;

import java.util.List;

public interface Job2personService {
    List<Job2person> queryJob2personByJid(int id);
}
