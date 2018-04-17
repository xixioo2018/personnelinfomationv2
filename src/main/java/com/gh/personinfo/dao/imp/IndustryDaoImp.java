package com.gh.personinfo.dao.imp;

import com.gh.personinfo.dao.IndustryDao;
import com.gh.personinfo.model.Industry;
import org.springframework.stereotype.Repository;

@Repository
public class IndustryDaoImp extends BaseDaoImpl<Industry> implements IndustryDao {
    public IndustryDaoImp() {
        super.setNs("com.gh.personinfo.dao.IndustryDao");
    }
}
