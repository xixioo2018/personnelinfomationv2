package com.gh.personinfo.company.dao.imp;


import com.gh.personinfo.company.dao.CompanyDao;
import com.gh.personinfo.other.dao.imp.BaseDaoImpl;
import com.gh.personinfo.company.model.Company;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CompanyDaoImp extends BaseDaoImpl<Company> implements CompanyDao {
    public CompanyDaoImp(){
        //设置命名空间
        super.setNs("com.gh.personinfo.company.dao.CompanyDao");
    }

    public List<Company> findAll(Map map) {
        List<Company> companyList = this.getSqlSession().selectList(this.getNs()+".find，map");
        return companyList;
    }
}
