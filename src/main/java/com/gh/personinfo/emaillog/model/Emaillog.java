package com.gh.personinfo.emaillog.model;

import com.gh.personinfo.job.model.Job;
import com.gh.personinfo.person.model.Person;
import com.gh.personinfo.project.model.Project;

import java.util.Date;

public class Emaillog {
    private Integer id;

    private Project proid;

    private Job jobid;

    private Person perid;

    private Date time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Project getProid() {
        return proid;
    }

    public void setProid(Project proid) {
        this.proid = proid;
    }

    public Job getJobid() {
        return jobid;
    }

    public void setJobid(Job jobid) {
        this.jobid = jobid;
    }

    public Person getPerid() {
        return perid;
    }

    public void setPerid(Person perid) {
        this.perid = perid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}