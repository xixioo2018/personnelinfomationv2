package com.gh.personinfo.dict.service.imp;

import com.gh.personinfo.dict.dao.DictDao;
import com.gh.personinfo.dict.model.Dict;
import com.gh.personinfo.dict.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DictServiceImp implements DictService {
    @Autowired
    DictDao dictDao;

    @Override
    public List<Dict> selectDict(Map<String,String> map) {
        return dictDao.find(map);
    }
}
