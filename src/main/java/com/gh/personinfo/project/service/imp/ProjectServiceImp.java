package com.gh.personinfo.project.service.imp;

import com.gh.personinfo.project.dao.ProjectDao;
import com.gh.personinfo.project.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectServiceImp implements ProjectService {
    @Autowired
    ProjectDao projectDao;
}
