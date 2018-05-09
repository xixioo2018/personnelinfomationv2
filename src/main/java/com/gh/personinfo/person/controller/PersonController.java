package com.gh.personinfo.person.controller;

import com.gh.personinfo.person.model.Person;
import com.gh.personinfo.person.service.PersonService;
import com.gh.personinfo.project.util.Pagination;
import com.gh.personinfo.project.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
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
    public Map<String,Object> queryperson(@RequestParam String serch,int start,int size){
        Map<String,Object> newMap = new HashMap<String, Object>();
        Map<String,Object> result = new HashMap<String, Object>();
        System.out.println(serch);
//        System.out.println(start+"----"+size);
        newMap = personService.deal(serch);
        System.out.println(newMap.toString());
        List<Person> personList = personService.queryperson(newMap);
//        for (Person p:
//             personList) {
//            System.out.println(p.toString());
//        }

        result.put("total", personList.size());
        result.put("rows",Pagination.subList(start,size , personList));
        return result;
    }

    /*
    匹配功能
     */
    @ResponseBody
    @RequestMapping("person-matchperson")
    /*(value = "boxIds[]")*/
    public Map<String,Object> queryperson(@RequestParam int jobtype,int jobid,int start,int size){
//        System.out.println("jobid---"+jobid);
//        System.out.println("jobtype---"+jobtype);
        Map<String,Object> result=new HashMap<String,Object>();

        List<Person> personList = personService.matchPerson(jobtype,jobid);
//        for (Person p:
//                personList) {
//            System.out.println(p.toString());
//        }
        result.put("total",personList.size());
        result.put("rows",Pagination.subList(start,size ,personList ));
        return result;
    }

    @ResponseBody
    @RequestMapping("person-updatePersonById")
    /*(value = "boxIds[]")*/
    public Map<String,String> updatePersonById(Person person,MultipartFile file,HttpServletRequest request){
        System.out.println("-------------"+person+"---------------");
        personService.updatePersonById(person);
        int index=1;
        return Result.back(index);
    }


    /**
     * 简历下载
     * @param file
     * @param filename
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("person-downPersonResume")
    public void download(String file,String filename, HttpServletRequest request,
                           HttpServletResponse response) throws Exception {
        //模拟文件，myfile.txt为需要下载的文件
//        String fileName = file;
        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(file)));
        //假如以中文名下载的话
//        String filename = filename;
        //转码，免得文件名中文乱码
        filename = URLEncoder.encode(filename,"UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while((len = bis.read()) != -1){
            out.write(len);
            out.flush();
        }
        out.close();
    }
}
