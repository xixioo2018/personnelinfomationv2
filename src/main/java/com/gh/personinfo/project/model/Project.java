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

    private String statime;//开始时间

    private String endtime;//结束时间

    private Integer comid;//公司

    private Integer state;//状态:开始 完成

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

    public String getStatime() {
        return statime;
    }

    public void setStatime(String statime) {
        this.statime = statime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public Integer getComid() {
        return comid;
    }

    public void setComid(Integer comid) {
        this.comid = comid;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getRequire() {
        return require;
    }

    public void setRequire(String require) {
        this.require = require;
    }

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", category=" + category +
                ", reqnum=" + reqnum +
                ", nownum=" + nownum +
                ", statime=" + statime +
                ", endtime=" + endtime +
                ", comid=" + comid +
                ", state=" + state +
                ", require='" + require + '\'' +
                '}';
    }
}
