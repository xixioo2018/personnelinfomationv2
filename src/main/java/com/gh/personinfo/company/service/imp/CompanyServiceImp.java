package com.gh.personinfo.company.service.imp;

import com.gh.personinfo.company.dao.CompanyDao;
import com.gh.personinfo.company.model.Company;
import com.gh.personinfo.company.service.CompanyService;
import com.gh.personinfo.dict.dao.DictDao;
import com.gh.personinfo.dict.model.Dict;
import com.gh.personinfo.person.model.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class CompanyServiceImp implements CompanyService {

    @Autowired
    CompanyDao companyDao;
    @Autowired
    DictDao dictDao;


    public List<Company> findAll(Map map) {
        return companyDao.findAll(map);
    }

    public Company get(Serializable id) {
        System.out.println("CompanyService");
        return companyDao.get(id);
    }
    @Override
    public void addCompany(Company company) {
        companyDao.insert(company);
    }

    @Override
    public List<Company> queryCompany(Map<String,Object> map) {
        System.out.println("查询前");
        List<Company> companyList = companyDao.find(map);
        System.out.println("查询后");
        return companyList;
    }

    @Override
    public void updateCompanyById(Company company) {
        companyDao.update(company);
    }

    @Override
    public Map<String, Object> deal(String search) {
        Map<String,String> map1 = new HashMap<String, String>();
        List<Dict> dictList = dictDao.find(map1);
        Map<String,Object> map = new HashMap<String, Object>();
        String[] example = {"行业类别","公司规模","公司地址"};
        String[] newSearch = search.split(" ");
        for (int i = 0 ; i < newSearch.length ; i++){
            for (int j = 0 ; j < example.length ; j++){
                if(newSearch[i].indexOf(example[j])!=-1){
                    String[] newStr = newSearch[i].split(example[j]);
                   /* System.out.println(newStr[1]);*/
                    System.out.println("key："+example[j]);
                    if(example[j].equals("行业类别")){
                        for (Dict dict:
                                dictList) {
                            if (newStr[1].equals(dict.getDictname())){
                                map.put("行业类别",dict.getId());
                                map.forEach((k,v)->System.out.println(k + " = " + v));
                            }
                        };
                    }else if (example[j].equals("公司规模")){
                        for (Dict dict:
                                dictList) {
                            if (newStr[1].equals(dict.getDictname())){
                                map.put("公司规模",dict.getId());
                                map.forEach((k,v)->System.out.println(k + " = " + v));
                            }
                        };
                    /*}else if (example[j].equals("招聘方向")){
                        *//*对应的数据字典*//*
                        System.out.println("进入"+newStr[1]);
                        for (Dict dict:
                                dictList) {
                            if (newStr[1].equals(dict.getDictname())){
                                map.put("招聘方向",dict.getId());
                                map.forEach((k,v)->System.out.println(k + " = " + v));
                            }
                        }*/
                    }else if(example[j].equals("公司地址")){
                        /*对应数据字典*/
                        System.out.println("公司地址");
                        //newStr1是关键字
                        map.put("公司地址",newStr[1]);
                        map.forEach((k,v)->System.out.println(k + " = " + v));
                    }
                    map.forEach((k,v)->System.out.println(k + " = " + v));
                }
            }
        }
        return map;
    }
    public String[] changge(String s1,Map<String,Object> map){
        String[] s2 = new String[2];
        System.out.println(s1);
        if(s1.equals("少于20人")){
            s2[0] = "0";
            s2[1] = "20";
        }
        if (s1.equals("20-50")){
            System.out.println("进入20-25");
            s2[0] = "20";
            s2[1] = "25";
        }
        if (s1.equals("50-100")){
            s2[0] = "25";
            s2[1] = "30";
        }
        if (s1.equals("100-500")){
            s2[0] = "35";
            s2[1] = "40";
        }
        if (s1.equals("500以上")){
            s2[0] = "40";
            s2[1] = "45";
        }

        return s2;
    }
}
