package com.gh.personinfo.company.dao;

import com.gh.personinfo.company.model.Company;
import com.gh.personinfo.other.dao.BaseDao;

import java.util.List;
import java.util.Map;

public interface CompanyDao extends BaseDao<Company> {
    public List<Company> findAll(Map map);
}
