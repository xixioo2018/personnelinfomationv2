package com.gh.personinfo.job.service;

import com.gh.personinfo.job.model.Job;

import java.util.List;

public interface JobService {
    public List<Job> queryJobById(int id);

    public void addJob(Job job);

    public void updateJobById(Job job);

    public void deleteJobById(Job job);
}
