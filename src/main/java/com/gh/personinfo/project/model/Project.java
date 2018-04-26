package com.gh.personinfo.project.model;

import com.gh.personinfo.company.model.Company;
import com.gh.personinfo.dict.model.Dict;

import java.util.Date;

public class Project {
    private Integer id;

    private String name;//项目名称

    private Integer category;//分类

    private Integer reqnum;//应有人数

    private Integer nownum;//实际人数

    private Date statime;//开始时间

    private Date endtime;//结束时间

    private Company comid;//公司

    private Dict state;//状态:开始 完成

    private String require;//项目简介

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
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

    public Date getStatime() {
        return statime;
    }

    public void setStatime(Date statime) {
        this.statime = statime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Company getComid() {
        return comid;
    }

    public void setComid(Company comid) {
        this.comid = comid;
    }

    public Dict getState() {
        return state;
    }

    public void setState(Dict state) {
        this.state = state;
    }

    public String getRequire() {
        return require;
    }

    public void setRequire(String require) {
        this.require = require;
    }
}
