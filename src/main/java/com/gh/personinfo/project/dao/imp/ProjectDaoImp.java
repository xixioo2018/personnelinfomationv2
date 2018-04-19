package com.gh.personinfo.project.dao.imp;

import com.gh.personinfo.other.dao.imp.BaseDaoImpl;
import com.gh.personinfo.project.dao.ProjectDao;
import com.gh.personinfo.project.model.Project;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectDaoImp extends BaseDaoImpl<Project> implements ProjectDao {
    public ProjectDaoImp() {
        super.setNs("com.gh.personinfo.project.dao.ProjectDao");
    }
}
