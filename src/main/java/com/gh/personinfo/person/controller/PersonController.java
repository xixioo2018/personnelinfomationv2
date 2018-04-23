package com.gh.personinfo.person.controller;

import com.gh.personinfo.person.model.Person;
import com.gh.personinfo.person.service.PersonService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

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
            String file_path = request.getSession().getServletContext().getRealPath("upload");
            newFileName = orginalFilename.substring(orginalFilename.lastIndexOf("."));
            File newFile = new File(file_path + newFileName);
            //写入磁盘
            file.transferTo(newFile);
            person.setResume(file_path+newFileName);
            System.out.println(person.toString());
        }
        personService.addPerson(person);
        /*model.addAttribute("image",newFileName);*/
        System.out.println("转跳");
        return "/addperson.jsp";
    }
}
