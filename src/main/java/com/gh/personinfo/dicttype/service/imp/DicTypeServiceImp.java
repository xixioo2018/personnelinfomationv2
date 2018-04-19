package com.gh.personinfo.dicttype.service.imp;

import com.gh.personinfo.dicttype.dao.DicTypeDao;
import com.gh.personinfo.dicttype.service.DicTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DicTypeServiceImp implements DicTypeService {
    @Autowired
    DicTypeDao dicTypeDao;
}
