package com.gh.personinfo.project.controller;

import com.gh.personinfo.project.service.ProjectService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class ProjectController {
    @Resource
    ProjectService projectService;
}
