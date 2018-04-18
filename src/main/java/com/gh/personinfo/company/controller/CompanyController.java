package com.gh.personinfo.company.controller;

import com.gh.personinfo.company.model.Company;
import com.gh.personinfo.company.service.CompanyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class CompanyController {
    @Resource
    CompanyService companyService;

    @RequestMapping("/company/hello")
    public String hello(Model model,HttpServletRequest request){
        System.out.println("hello");
/*        Map<String,String> map = new HashMap<String, String>();
        map.put("name","zs");
        map.put("name","ls");
        List<Company> companyList = companyService.findAll(map);*/
        Company company = companyService.get("1");
        model.addAttribute("company",company);
        System.out.println(company.toString());
        return "/success.jsp";
    }
}
