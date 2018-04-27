package com.gh.personinfo.person.controller;

import com.gh.personinfo.person.model.Person;
import com.gh.personinfo.person.service.PersonService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PersonController {
    @Resource
    PersonService personService;
    @RequestMapping("person-toaddperson.a")
    public String addperson(){
        System.out.println("person/addperson.a");
        return "/addperson.jsp";
    }
    @RequestMapping("person-toperson.a")
    public String person(){
        System.out.println("person/person.a");
        return "/person.jsp";
    }
    @RequestMapping("person-uploadperson")
    public String uploadperson(Person person,Model model, MultipartFile file,HttpServletRequest request) throws Exception {
        System.out.println("uploadperson");
        String orginalFilename = file.getOriginalFilename();
        String newFileName = null;
        if(file != null && orginalFilename != null && orginalFilename.length() > 0) {
            //存储图片的物理路径
            String file_path = request.getSession().getServletContext().getRealPath("WEB-INF/upload");
            newFileName = orginalFilename.substring(orginalFilename.lastIndexOf("."));
            System.out.println(file_path);
            System.out.println(newFileName);
            File newFile = new File(file_path +"\\"+ orginalFilename);

            //写入磁盘
            file.transferTo(newFile);
            person.setResume(file_path +"\\"+ orginalFilename);
            System.out.println(person.toString());
        }
        personService.addPerson(person);
        /*model.addAttribute("image",newFileName);*/
        System.out.println("转跳");
        return "/addperson.jsp";
    }
    @ResponseBody
    @RequestMapping("person-queryperson")
    /*(value = "boxIds[]")*/
    public List<Person> queryperson(@RequestParam String serch){
        Map<String,Object> newMap = new HashMap<String, Object>();
        System.out.println(serch);
        newMap = personService.deal(serch);
        System.out.println(newMap.toString());
        List<Person> personList = personService.queryperson(newMap);
        for (Person p:
             personList) {
            System.out.println(p.toString());
        }
        return personList;
    }

    /*
    匹配功能
     */
    @ResponseBody
    @RequestMapping("person-matchperson")
    /*(value = "boxIds[]")*/
    public List<Person> queryperson(@RequestParam int jobtype,int jobid){
        System.out.println("jobid---"+jobid);
        System.out.println("jobtype---"+jobtype);

        List<Person> personList = personService.matchPerson(jobtype,jobid);
        for (Person p:
                personList) {
            System.out.println(p.toString());
        }
        return personList;
    }
}
