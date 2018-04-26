package com.gh.personinfo.job2person.model;

import com.gh.personinfo.dict.model.Dict;
import com.gh.personinfo.job.model.Job;
import com.gh.personinfo.person.model.Person;

public class Job2person {
    private Integer id;

    private Integer jobid;//job Id

    private Integer jobtype;

    private Integer perid;

    private Integer status;

    private Integer isinter;//是否面试

    private Integer ishire;//是否上岗

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getJobid() {
        return jobid;
    }

    public void setJobid(Integer jobid) {
        this.jobid = jobid;
    }

    public Integer getJobtype() {
        return jobtype;
    }

    public void setJobtype(Integer jobtype) {
        this.jobtype = jobtype;
    }

    public Integer getPerid() {
        return perid;
    }

    public void setPerid(Integer perid) {
        this.perid = perid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
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