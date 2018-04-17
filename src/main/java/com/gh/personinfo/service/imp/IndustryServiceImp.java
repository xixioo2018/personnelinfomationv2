package com.gh.personinfo.service.imp;

import com.gh.personinfo.dao.IndustryDao;
import com.gh.personinfo.service.IndustryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class IndustryServiceImp implements IndustryService {

    @Resource
    IndustryDao industryDao;
}
