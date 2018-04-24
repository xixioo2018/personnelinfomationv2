package com.gh.personinfo.company.service;

import com.gh.personinfo.company.model.Company;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface CompanyService {
    public List<Company> findAll(Map map);//查询所有公司
    public Company get(Serializable id);//查询一个
    public void addCompany(Company company);//添加企业信息
}
