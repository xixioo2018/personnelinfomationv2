package com.gh.personinfo.job2person.dao.imp;

import com.gh.personinfo.job2person.dao.Job2personDao;
import com.gh.personinfo.job2person.model.Job2person;
import com.gh.personinfo.other.dao.imp.BaseDaoImpl;
import org.springframework.stereotype.Repository;

@Repository
public class Job2personDaoImp extends BaseDaoImpl<Job2person> implements Job2personDao {
    public Job2personDaoImp() {
        super.setNs("com.gh.personinfo.job2person.dao.Job2personDao");
    }
}
