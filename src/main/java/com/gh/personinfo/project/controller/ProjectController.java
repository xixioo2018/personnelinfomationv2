package com.gh.personinfo.project.controller;

import com.gh.personinfo.company.model.Company;
import com.gh.personinfo.person.model.Person;
import com.gh.personinfo.project.model.Project;
import com.gh.personinfo.project.service.ProjectService;
import com.gh.personinfo.project.util.Pagination;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProjectController {
    @Resource
    ProjectService projectService;

    @RequestMapping("project-queryProjectById")
    @ResponseBody
    public Map<String,Object> queryProjectById(@RequestParam int id,int start,int size ){
        List<Project> projectList = projectService.queryProjectById(id);
        Map<String,Object> result=new HashMap<String,Object>();
        result.put("total",projectList.size());
        result.put("rows",Pagination.subList(start,size,projectList ));
        //转化时间格式
//        System.out.println("---------------");
//        System.out.println(projectList.size());
//        for (Project project:projectList) {
//            System.out.println(project);
//        }
//        System.out.println("---------------");

        return result;
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
