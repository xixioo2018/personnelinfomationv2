package com.gh.personinfo.service.imp;

import com.gh.personinfo.dao.CompanyDao;
import com.gh.personinfo.model.Company;
import com.gh.personinfo.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
        return companyDao.get(id);
    }
}
