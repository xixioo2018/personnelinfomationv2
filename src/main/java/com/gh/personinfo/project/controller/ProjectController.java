package com.gh.personinfo.project.controller;

import com.gh.personinfo.company.model.Company;
import com.gh.personinfo.person.model.Person;
import com.gh.personinfo.project.model.Project;
import com.gh.personinfo.project.service.ProjectService;
import com.gh.personinfo.project.util.Testmail;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class ProjectController {
    @Resource
    ProjectService projectService;

    @RequestMapping("project-queryProjectById")
    @ResponseBody
    public List<Project> queryProjectById(@RequestParam int id ){
        List<Project> projectList = projectService.queryProjectById(id);

        //转化时间格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println("---------------");
        System.out.println(projectList.size());
        for (Project project:projectList) {
            System.out.println(project);
        }
        System.out.println("---------------");

        return projectList;
    }

    @ResponseBody
    @RequestMapping("project-addProject")
    public Integer addProject(Project project){
        System.out.println(project);
        projectService.addProject(project);
        return 1;
    }

    @ResponseBody
    @RequestMapping("project-updateProject")
    public Integer updateProject(Project project){
        projectService.updateProject(project);
        return 1;
    }

    

}
