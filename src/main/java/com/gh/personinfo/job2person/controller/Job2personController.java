package com.gh.personinfo.job2person.controller;

import com.gh.personinfo.job.service.JobService;
import com.gh.personinfo.job2person.model.Job2person;
import com.gh.personinfo.job2person.service.Job2personService;
import com.gh.personinfo.project.util.Pagination;
import com.gh.personinfo.project.util.Testmail;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class Job2personController {
    @Resource
    Job2personService job2personService;

    @RequestMapping("job2person-queryJob2personByJid")
    @ResponseBody
    public Map<String,Object> queryJob2personByJid(@RequestParam int id,int start,int size){
        Map<String,Object> result=new HashMap<String,Object>();
        List<Job2person> job2peopleList = job2personService.queryJob2personByJid(id);
//        System.out.println("------job2person---------");
//        System.out.println(job2peopleList.size());
//        for (Job2person job2person: job2peopleList) {
//            System.out.println(job2person);
//        }
//        System.out.println("------job2person---------");

        result.put("total",job2peopleList.size() );
        result.put("rows",Pagination.subList(start,size ,job2peopleList ));

        return result;
    }

    @ResponseBody
    @RequestMapping("job2person-updateJob2personById")
    /*(value = "boxIds[]")*/
    public Map updateJob2personById( Job2person job2person){
        Map map=new HashMap();
        System.out.println("-------update---------");
        System.out.println(job2person);
        map.put("result", 1);
        job2personService.updateJob2personById(job2person);
        return map;
    }
    /**
     * 发邮件接口
     */

    @RequestMapping("project-sendEmail")
    public void sendEmail(String to,String fileName,Job2person job2person){
        System.out.println(to+"------"+fileName);
        to = "613327951@qq.com";
        fileName = "E:\\test.txt";
        System.out.println(to+"------"+fileName);
        //Testmail testmail = new Testmail();
        job2personService.insertJob2person(to,fileName,job2person);
            //testmail.Send(to,fileName);
            /*e.printStackTrace();*/
        return ;
    }
}
