package com.gh.personinfo.dao.imp;

import com.gh.personinfo.dao.BaseDao;
import com.gh.personinfo.dao.PositionDao;
import com.gh.personinfo.model.Position;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class PositionDaoImp extends BaseDaoImpl<Position> implements PositionDao{
    public PositionDaoImp() {
        super.setNs("com.gh.personinfo.dao.PositionDao");
    }
}
