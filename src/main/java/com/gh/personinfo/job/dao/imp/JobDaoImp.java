package com.gh.personinfo.job.dao.imp;

import com.gh.personinfo.job.dao.JobDao;
import com.gh.personinfo.job.model.Job;
import com.gh.personinfo.other.dao.imp.BaseDaoImpl;
import org.springframework.stereotype.Repository;

@Repository
public class JobDaoImp extends BaseDaoImpl<Job> implements JobDao {
    public JobDaoImp() {
        super.setNs("com.gh.personinfo.job.dao.JobDao");
    }
}
