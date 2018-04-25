package com.gh.personinfo.company.model;

import com.gh.personinfo.dict.model.Dict;

public class Company {
    private Integer id;//编号

    private String name;//公司名

    private Integer scale;//公司规模

    private Integer business;//业务类型 多条

    private String conname;//联系人姓名

    private String conphone;//联系人电话

    private String conemail;//联系人邮箱

    private String address;//公司地址

    private String description;//公司简介

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

    public Integer getScale() {
        return scale;
    }

    public void setScale(Integer scale) {
        this.scale = scale;
    }

    public Integer getBusiness() {
        return business;
    }

    public void setBusiness(Integer business) {
        this.business = business;
    }

    public String getConname() {
        return conname;
    }

    public void setConname(String conname) {
        this.conname = conname;
    }

    public String getConphone() {
        return conphone;
    }

    public void setConphone(String conphone) {
        this.conphone = conphone;
    }

    public String getConemail() {
        return conemail;
    }

    public void setConemail(String conemail) {
        this.conemail = conemail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}