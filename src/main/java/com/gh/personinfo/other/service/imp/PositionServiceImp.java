package com.gh.personinfo.other.service.imp;

import com.gh.personinfo.other.dao.PositionDao;
import com.gh.personinfo.other.service.PositionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PositionServiceImp implements PositionService {

    @Resource
    PositionDao positionDao;
}
