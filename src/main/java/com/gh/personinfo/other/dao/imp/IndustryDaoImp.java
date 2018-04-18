package com.gh.personinfo.other.dao.imp;

import com.gh.personinfo.other.dao.IndustryDao;
import com.gh.personinfo.other.model.Industry;
import org.springframework.stereotype.Repository;

@Repository
public class IndustryDaoImp extends BaseDaoImpl<Industry> implements IndustryDao {
    public IndustryDaoImp() {
        super.setNs("com.gh.personinfo.dao.IndustryDao");
    }
}
