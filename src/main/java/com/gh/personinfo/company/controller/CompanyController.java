package com.gh.personinfo.company.controller;

import com.gh.personinfo.company.model.Company;
import com.gh.personinfo.company.service.CompanyService;
import com.gh.personinfo.person.model.Person;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @ResponseBody
    @RequestMapping("company-querycompany")
    /*(value = "boxIds[]")*/
    public List<Company> queryperson(@RequestParam String serch){
        Map<String,Object> newMap = new HashMap<String, Object>();
        System.out.println(serch);
        newMap = companyService.deal(serch);
        List<Company> companyList = companyService.queryCompany(newMap);
        for (Company p:
                companyList) {
            System.out.println(p.toString());
        }
        return companyList;
    }
}
