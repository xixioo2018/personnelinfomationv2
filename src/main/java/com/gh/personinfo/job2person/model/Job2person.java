package com.gh.personinfo.job2person.model;

import com.gh.personinfo.dict.model.Dict;
import com.gh.personinfo.job.model.Job;
import com.gh.personinfo.person.model.Person;

public class Job2person {
    private Integer id;

    private Job jobid;//job Id

    private Dict jobtype;

    private Person perid;

    private Dict status;

    private Integer isinter;//是否面试

    private Integer ishire;//是否上岗

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Job getJobid() {
        return jobid;
    }

    public void setJobid(Job jobid) {
        this.jobid = jobid;
    }

    public Dict getJobtype() {
        return jobtype;
    }

    public void setJobtype(Dict jobtype) {
        this.jobtype = jobtype;
    }

    public Person getPerid() {
        return perid;
    }

    public void setPerid(Person perid) {
        this.perid = perid;
    }

    public Dict getStatus() {
        return status;
    }

    public void setStatus(Dict status) {
        this.status = status;
    }

    public Integer getIsinter() {
        return isinter;
    }

    public void setIsinter(Integer isinter) {
        this.isinter = isinter;
    }

    public Integer getIshire() {
        return ishire;
    }

    public void setIshire(Integer ishire) {
        this.ishire = ishire;
    }
}