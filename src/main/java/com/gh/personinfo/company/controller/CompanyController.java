package com.gh.personinfo.company.controller;

import com.gh.personinfo.company.model.Company;
import com.gh.personinfo.company.service.CompanyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
@Controller
public class CompanyController {
    @Resource
    CompanyService companyService;

    @RequestMapping("/company-toaddcompany.a")
    public String toaddcompany(){
        return "/addcompany.jsp";
    }
    @RequestMapping("/company-tocompany.a")
    public String tocompany(){
        return "/company.jsp";
    }
    @RequestMapping("/company-toproject.a")
    public String toproject(){
        return "/project.jsp";
    }
    @RequestMapping("company-addCompany")
    public String addCompany(Company company,@RequestParam String flag){
        System.out.println(company);
        System.out.println("flag="+flag);
        companyService.addCompany(company);
        if(flag.equals("true")){
            return "/addcompany.jsp";
        }else{
            return "/home.jsp";
        }
    }
}
