package com.gh.personinfo.job2person.controller;

import com.gh.personinfo.job.service.JobService;
import com.gh.personinfo.job2person.model.Job2person;
import com.gh.personinfo.job2person.service.Job2personService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class Job2personController {
    @Resource
    Job2personService job2personService;

    @RequestMapping("job2person-queryJob2personByJid")
    @ResponseBody
    public List<Job2person> queryJob2personByJid(@RequestParam int id ){
        List<Job2person> job2peopleList = job2personService.queryJob2personByJid(id);
        System.out.println("------job2person---------");
        System.out.println(job2peopleList.size());
        for (Job2person job2person: job2peopleList) {
            System.out.println(job2person);
        }
        System.out.println("------job2person---------");

        return job2peopleList;
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
}
