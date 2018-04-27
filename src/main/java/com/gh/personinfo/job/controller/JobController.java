package com.gh.personinfo.job.controller;

import com.gh.personinfo.job.model.Job;
import com.gh.personinfo.job.service.JobService;
import com.gh.personinfo.project.model.Project;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class JobController {
    @Resource
    JobService jobService;

    @RequestMapping("job-queryJobById")
    @ResponseBody
    public List<Job> queryJobById(@RequestParam int id ){
        List<Job> jobList = jobService.queryJobById(id);
        return jobList;
    }
}
