package com.gh.personinfo.job.model;

import com.gh.personinfo.dict.model.Dict;
import com.gh.personinfo.project.model.Project;

public class Job {
    private Integer id;

    private Project proid;//项目

    private Integer reqnum;//应有人数

    private Integer nownum;//实际人数

    private Integer matnum;//匹配人数

    private Dict jobtype;//业务类型

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

    public Integer getReqnum() {
        return reqnum;
    }

    public void setReqnum(Integer reqnum) {
        this.reqnum = reqnum;
    }

    public Integer getNownum() {
        return nownum;
    }

    public void setNownum(Integer nownum) {
        this.nownum = nownum;
    }

    public Integer getMatnum() {
        return matnum;
    }

    public void setMatnum(Integer matnum) {
        this.matnum = matnum;
    }

    public Dict getJobtype() {
        return jobtype;
    }

    public void setJobtype(Dict jobtype) {
        this.jobtype = jobtype;
    }

    @Override
    public String toString() {
        return "Job{" +
                "id=" + id +
                ", proid=" + proid +
                ", reqnum=" + reqnum +
                ", nownum=" + nownum +
                ", matnum=" + matnum +
                ", jobtype=" + jobtype +
                '}';
    }
}