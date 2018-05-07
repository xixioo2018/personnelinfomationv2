package com.gh.personinfo.project.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 增删改的结果返回
 */
public class Result {
    public static Map<String,String> back(int index){
        Map<String,String>result=new HashMap<String,String>();
        if(index>0){
            result.put("result","成功");
        }else{
            result.put("result","失败");
        }
        return result;
    }
}
