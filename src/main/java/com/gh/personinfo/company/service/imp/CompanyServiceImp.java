package com.gh.personinfo.company.service.imp;

import com.gh.personinfo.company.dao.CompanyDao;
import com.gh.personinfo.company.model.Company;
import com.gh.personinfo.company.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


@Service
public class CompanyServiceImp implements CompanyService {

    @Autowired
    CompanyDao companyDao;


    @Override
    public List<Company> findAll(Map map) {
        return companyDao.findAll(map);
    }

    @Override
    public Company get(Serializable id) {
        System.out.println("CompanyService");
        return companyDao.get(id);
    }
}
