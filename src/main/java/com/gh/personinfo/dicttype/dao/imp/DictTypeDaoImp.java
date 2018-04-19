package com.gh.personinfo.dicttype.dao.imp;

import com.gh.personinfo.dicttype.dao.DicTypeDao;
import com.gh.personinfo.dictionary.model.DicType;
import com.gh.personinfo.other.dao.imp.BaseDaoImpl;
import org.springframework.stereotype.Repository;

@Repository
public class DictTypeDaoImp extends BaseDaoImpl<DicType> implements DicTypeDao {
    public DictTypeDaoImp() {
        super.setNs("com.gh.personinfo.dictionary.dao.DicTypeDao");
    }
}
