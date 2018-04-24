package com.gh.personinfo.dict.service;

import com.gh.personinfo.dict.model.Dict;

import java.util.List;
import java.util.Map;

public interface DictService {
    public List<Dict> selectDict(Map<String,String> map);
}
