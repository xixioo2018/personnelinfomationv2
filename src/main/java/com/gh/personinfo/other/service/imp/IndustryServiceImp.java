package com.gh.personinfo.other.service.imp;

import com.gh.personinfo.other.dao.IndustryDao;
import com.gh.personinfo.other.service.IndustryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class IndustryServiceImp implements IndustryService {

    @Resource
    IndustryDao industryDao;
}
