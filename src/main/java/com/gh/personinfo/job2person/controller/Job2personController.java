package com.gh.personinfo.job2person.controller;

import com.gh.personinfo.job.service.JobService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class Job2personController {
    @Resource
    JobService jobService;
}
