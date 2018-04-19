package com.gh.personinfo.emaillog.dao.imp;

import com.gh.personinfo.emaillog.dao.EmaillogDao;
import com.gh.personinfo.emaillog.model.Emaillog;
import com.gh.personinfo.other.dao.imp.BaseDaoImpl;
import org.springframework.stereotype.Repository;

@Repository
public class EmaillogDaoImp extends BaseDaoImpl<Emaillog> implements EmaillogDao {
    public EmaillogDaoImp() {
        super.setNs("com.gh.personinfo.emaillog.dao.EmaillogDao");
    }
}
