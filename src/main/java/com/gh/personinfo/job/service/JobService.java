package com.gh.personinfo.job.service;

import com.gh.personinfo.job.model.Job;

import java.util.List;

public interface JobService {
    public List<Job> queryJobById(int id);
}
