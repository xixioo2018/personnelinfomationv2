package com.gh.personinfo.dict.service.imp;

import com.gh.personinfo.dict.dao.DictDao;
import com.gh.personinfo.dict.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DictServiceImp implements DictService {
    @Autowired
    DictDao dictDao;
}
