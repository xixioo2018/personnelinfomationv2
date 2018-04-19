package com.gh.personinfo.job.controller;

import com.gh.personinfo.job.service.JobService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class JobController {
    @Resource
    JobService jobService;
}
