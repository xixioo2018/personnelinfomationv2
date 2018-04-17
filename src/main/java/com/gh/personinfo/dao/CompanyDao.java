package com.gh.personinfo.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

import com.gh.personinfo.model.Company;

public interface CompanyDao extends BaseDao<Company>{
    public List<Company> findAll(Map map);
}
