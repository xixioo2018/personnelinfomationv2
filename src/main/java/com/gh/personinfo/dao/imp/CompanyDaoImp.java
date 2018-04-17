package com.gh.personinfo.dao.imp;

import com.gh.personinfo.dao.CompanyDao;
import com.gh.personinfo.model.Company;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CompanyDaoImp extends BaseDaoImpl<Company> implements CompanyDao {
    public CompanyDaoImp(){
        //设置命名空间
        super.setNs("com.gh.personinfo.dao.CompanyDao");
    }

    @Override
    public List<Company> findAll(Map map) {
        List<Company> companyList = this.getSqlSession().selectList(this.getNs()+".find，map");
        return companyList;
    }
}
