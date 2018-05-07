package com.gh.personinfo.job.controller;

import com.gh.personinfo.job.model.Job;
import com.gh.personinfo.job.service.JobService;
import com.gh.personinfo.project.model.Project;
import com.gh.personinfo.project.util.Pagination;
import com.gh.personinfo.project.util.Result;
import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class JobController {
    @Resource
    JobService jobService;

    @RequestMapping("job-queryJobById")
    @ResponseBody
    public Map<String,Object> queryJobById(@RequestParam int id, int start, int size ){
        Map<String,Object> result=new HashMap<String,Object>();
        List<Job> jobList = jobService.queryJobById(id);
        result.put("total",jobList.size());
        result.put("rows",Pagination.subList(start,size,jobList ));
        return result;
    }


    @RequestMapping("job-addJob")
    public Map<String,String> addJob(Job job){
        jobService.addJob(job);
        int index=1;
        return Result.back(index);
    }

    @RequestMapping("job-updateJobById")
    @ResponseBody
    public Map<String,String> updateJobById(Job job){
        jobService.updateJobById(job);
        int index=1;
        return Result.back(index);
    }

    @RequestMapping("job-deleteJobById")
    @ResponseBody
    public Map<String,String> deleteJobById(Job job){
        jobService.deleteJobById(job);
        int index=1;
        return Result.back(index);
    }


}
