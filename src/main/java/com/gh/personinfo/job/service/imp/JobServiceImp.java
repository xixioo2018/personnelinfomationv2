package com.gh.personinfo.job.service.imp;

import com.gh.personinfo.job.dao.JobDao;
import com.gh.personinfo.job.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.enterprise.event.Observes;

@Service
public class JobServiceImp implements JobService {
    @Autowired
    JobDao jobDao;
}
