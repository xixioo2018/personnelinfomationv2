package com.gh.personinfo.dict.dao.imp;

import com.gh.personinfo.dict.dao.DictDao;
import com.gh.personinfo.dict.model.Dict;
import com.gh.personinfo.other.dao.imp.BaseDaoImpl;
import org.springframework.stereotype.Repository;

@Repository
public class DictDaoImp extends BaseDaoImpl<Dict> implements DictDao {
    public DictDaoImp() {
        super.setNs("com.gh.personinfo.dict.dao.DictDao");
    }

}
