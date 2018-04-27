package com.gh.personinfo.job.service.imp;

import com.gh.personinfo.job.dao.JobDao;
import com.gh.personinfo.job.model.Job;
import com.gh.personinfo.job.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.enterprise.event.Observes;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class JobServiceImp implements JobService {
    @Autowired
    JobDao jobDao;

    @Override
    public List<Job> queryJobById(int proid) {
        Map<String,Integer> map = new HashMap<>();
        map.put("proid",proid);
        return jobDao.find(map);
    }

    @Override
    public void addJob(Job job) {
        jobDao.insert(job);
    }

    @Override
    public void updateJobById(Job job) {
        jobDao.update(job);
    }
}
