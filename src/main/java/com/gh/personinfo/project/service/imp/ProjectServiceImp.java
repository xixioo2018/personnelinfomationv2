package com.gh.personinfo.project.service.imp;

import com.gh.personinfo.project.dao.ProjectDao;
import com.gh.personinfo.project.model.Project;
import com.gh.personinfo.project.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProjectServiceImp implements ProjectService {
    @Autowired
    ProjectDao projectDao;

    @Override
    public List<Project> queryProjectById(int id) {
        Map<String,Integer> map = new HashMap<>();
        map.put("id",id);
        return projectDao.find(map);
    }

    @Override
    public int addProject(Project project) {
        projectDao.insert(project);
        return 0;
    }

    @Override
    public int updateProject(Project project) {
        projectDao.update(project);
        return 0;
    }
}
