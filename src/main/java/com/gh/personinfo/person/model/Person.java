package com.gh.personinfo.person.model;

import com.gh.personinfo.company.model.Company;
import com.gh.personinfo.dict.model.Dict;
import com.gh.personinfo.job.model.Job;

import java.util.Date;

public class Person {
    private Integer id;
    private String name;//名称
    private Integer age;//年龄
    private String gender;//性别
    private Integer education;//学历  数据字典
    private String school;//毕业学校
    private Integer category;//行业类别  数据字典
    private String company;//所在公司
    private Integer job;//求职方向  数据字典
    private Integer experience;//工作经验
    private Integer status;//状态
    private String resume;//简历附件
    private Integer priority;//优先度

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getEducation() {
        return education;
    }

    public void setEducation(Integer education) {
        this.education = education;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
    }

    public Integer getJob() {
        return job;
    }

    public void setJob(Integer job) {
        this.job = job;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Integer getExperience() {
        return experience;
    }

    public void setExperience(Integer experience) {
        this.experience = experience;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    @Override
    public String toString() {
        return "Person{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", gender='" + gender + '\'' +
                ", education=" + education +
                ", school='" + school + '\'' +
                ", category=" + category +
                ", company='" + company + '\'' +
                ", job=" + job +
                ", experience=" + experience +
                ", status=" + status +
                ", resume='" + resume + '\'' +
                ", priority=" + priority +
                '}';
    }
}
