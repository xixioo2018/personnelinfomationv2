package com.gh.personinfo.dict.controller;

import com.gh.personinfo.dict.model.Dict;
import com.gh.personinfo.dict.service.DictService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DictController {
    @Resource
    DictService dictService;

    @ResponseBody
    @RequestMapping("dict-queryage")
    public List<Dict> dictQueryage(){
        Map<String,String> map = new HashMap<String, String>();
        List<Dict> agedictlist = dictService.selectDict(map);
        for (Dict dict:
                agedictlist) {
            System.out.println(dict.toString());
        }
        return agedictlist;
    }
}
