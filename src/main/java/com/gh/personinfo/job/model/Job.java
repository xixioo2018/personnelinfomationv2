package com.gh.personinfo.job.model;


public class Job {
    private Integer id;

    private Integer proid;//项目

    private Integer reqnum;//应有人数

    private Integer nownum;//实际人数

    private Integer matnum;//匹配人数

    private Integer jobtype;//业务类型

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

    public Integer getJobtype() {
        return jobtype;
    }

    public void setJobtype(Integer jobtype) {
        this.jobtype = jobtype;
    }
}