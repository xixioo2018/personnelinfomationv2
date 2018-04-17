package com.gh.personinfo.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import com.gh.personinfo.model.Position;
import org.mybatis.spring.annotation.MapperScan;

public interface PositionDao extends BaseDao<Position>{

}
