package com.gh.personinfo.other.dao.imp;

import com.gh.personinfo.other.dao.PositionDao;
import com.gh.personinfo.other.model.Position;
import org.springframework.stereotype.Repository;

@Repository
public class PositionDaoImp extends BaseDaoImpl<Position> implements PositionDao{
    public PositionDaoImp() {
        super.setNs("com.gh.personinfo.dao.PositionDao");
    }
}
