package com.gh.personinfo.emaillog.model;

import com.gh.personinfo.job.model.Job;
import com.gh.personinfo.person.model.Person;
import com.gh.personinfo.project.model.Project;

import java.util.Date;

public class Emaillog {
    private Integer id;

    private Integer proid;

    private Integer jobid;

    private Integer perid;

    private Date time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public Integer getJobid() {
        return jobid;
    }

    public void setJobid(Integer jobid) {
        this.jobid = jobid;
    }

    public Integer getPerid() {
        return perid;
    }

    public void setPerid(Integer perid) {
        this.perid = perid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}