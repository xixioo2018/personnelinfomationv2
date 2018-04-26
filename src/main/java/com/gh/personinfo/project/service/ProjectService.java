package com.gh.personinfo.project.service;

import com.gh.personinfo.project.model.Project;

import java.util.List;

public interface ProjectService {

    public List<Project> queryProjectById(int id);
}
