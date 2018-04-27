package com.gh.personinfo.job2person.service.imp;

import com.gh.personinfo.job2person.dao.Job2personDao;
import com.gh.personinfo.job2person.model.Job2person;
import com.gh.personinfo.job2person.service.Job2personService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class Job2personServiceImp implements Job2personService {
    @Autowired
    Job2personDao job2personDao;

    @Override
    public List<Job2person> queryJob2personByJid(int id) {
        Map map=new HashMap();
        map.put("jobId", id);
        return job2personDao.find(map);
    }

    @Override
    public void updateJob2personById(Job2person job2person) {
        job2personDao.update(job2person);
    }
}
