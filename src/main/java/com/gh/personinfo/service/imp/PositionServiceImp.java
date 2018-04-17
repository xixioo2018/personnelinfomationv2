package com.gh.personinfo.service.imp;

import com.gh.personinfo.dao.PositionDao;
import com.gh.personinfo.model.Position;
import com.gh.personinfo.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PositionServiceImp implements PositionService {

    @Resource
    PositionDao positionDao;
}
