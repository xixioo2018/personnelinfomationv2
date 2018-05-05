package com.gh.personinfo.job2person.service;

import com.gh.personinfo.job.model.Job;
import com.gh.personinfo.job2person.model.Job2person;

import java.util.List;

public interface Job2personService {
    List<Job2person> queryJob2personByJid(int id);

    public void updateJob2personById(Job2person job2person);

    public void insertJob2person(String to,String fileName,Job2person job2person);

    public void updatematchproject(Integer projectId);

    public void updatematchjob(Job job);
}
