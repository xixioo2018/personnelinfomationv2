package com.gh.personinfo.person.service.imp;

import com.gh.personinfo.dict.dao.DictDao;
import com.gh.personinfo.dict.model.Dict;
import com.gh.personinfo.person.dao.PersonDao;
import com.gh.personinfo.person.model.Person;
import com.gh.personinfo.person.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PersonServiceImp implements PersonService {
    @Autowired
    PersonDao personDao;
    @Autowired
    DictDao dictDao;

    public int addPerson(Person person) {
        personDao.insert(person);
        return 0;
    }

    @Override
    public List<Person> queryperson(Map<String,Object> map) {
        System.out.println("查询前");
        List<Person> personList = personDao.find(map);
        System.out.println("查询后");
        return personList;
    }

    @Override
    public Map<String, Object> deal(String search) {
        Map<String,String> map1 = new HashMap<String, String>();
        List<Dict> dictList = dictDao.find(map1);
        Map<String,Object> map = new HashMap<String, Object>();
        String[] example = {"年龄","性别","学历","行业类别","求职方向","工作经验"};
        String[] newSearch = search.split(" ");
        for (int i = 0 ; i < newSearch.length ; i++){
            for (int j = 0 ; j < example.length ; j++){
                if(newSearch[i].indexOf(example[j])!=-1){
                    String[] newStr = newSearch[i].split(example[j]);
                    System.out.println(newStr[1]);
                    System.out.println("key："+example[j]);
                    if(example[j].equals("年龄")){
                        /*对应数据字典*/
                        System.out.println("进入年龄");
                        //newStr1是关键字
                        String[] str2 = changge(newStr[1],map);
                        map.put("年龄",12);
                        map.put("age0",str2[0]);
                        map.put("age1",str2[1]);
                        map.forEach((k,v)->System.out.println(k + " = " + v));
                    }else if (example[j].equals("工作经验")){
                        String[] str3 = changge(newStr[1],map);
                        map.put("工作经验","123");
                        map.put("workage0",str3[0]);
                        map.put("workage1",str3[1]);
                        map.forEach((k,v)->System.out.println(k + " = " + v));
                    }else if (example[j].equals("行业类别")){
                        /*对应的数据字典*/
                        System.out.println("进入"+newStr[1]);

                        for (Dict dict:
                             dictList) {
                            if (newStr[1].equals(dict.getDictname())){
                                map.put("行业类别",dict.getId());
                                System.out.println(dict.getId());
                                map.forEach((k,v)->System.out.println(k + " = " + v));
                            }
                        }
                    }else if(example[j].equals("学历")){
                        /*对应数据字典*/
                        System.out.println("进入"+newStr[1]);
                        for (Dict dict:
                                dictList) {
                            if (newStr[1].equals(dict.getDictname())){
                                map.put("学历",dict.getId());
                                System.out.println(dict.getId());
                                map.forEach((k,v)->System.out.println(k + " = " + v));
                            }
                        }
                    }else if(example[j].equals("求职方向")){
                        /*对应Job*/
                        System.out.println("进入"+newStr[1]);
                        for (Dict dict:
                                dictList) {
                            if (newStr[1].equals(dict.getDictname())){
                                map.put("求职方向",dict.getId());
                                System.out.println(dict.getId());
                                map.forEach((k,v)->System.out.println(k + " = " + v));
                            }
                        }
                    }else {
                        map.put(example[j],newStr[1]);
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
        if(s1.equals("小于20岁")){
            s2[0] = "0";
            s2[1] = "20";
        }
        if (s1.equals("20-25")){
            System.out.println("进入20-25");
            s2[0] = "20";
            s2[1] = "25";
        }
        if (s1.equals("25-30")){
            s2[0] = "25";
            s2[1] = "30";
        }
        if (s1.equals("35-40")){
            s2[0] = "35";
            s2[1] = "40";
        }
        if (s1.equals("40-45")){
            s2[0] = "40";
            s2[1] = "45";
        }
        if (s1.equals("45-50")){
            s2[0] = "45";
            s2[1] = "50";
        }
        if(s1.equals("应届毕业生")){
            s2[0] = "0";
            s2[1] = "0";
        }
        if(s1.equals("小于1年")){
            s2[0] = "0";
            s2[1] = "1";
        }
        if(s1.equals("1-3年")){
            s2[0] = "1";
            s2[1] = "3";
        }
        if(s1.equals("3-5年")){
            s2[0] = "3";
            s2[1] = "5";
        }
        if(s1.equals("5-7年")){
            s2[0] = "5";
            s2[1] = "7";
        }
        if(s1.equals("7年以上")){
            s2[0] = "7";
            s2[1] = "100";
        }
        for (String s:
             s2) {
            System.out.println("cnm"+s);
        }
        return s2;
    }
}
