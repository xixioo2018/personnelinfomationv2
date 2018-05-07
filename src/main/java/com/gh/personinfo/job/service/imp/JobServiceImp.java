package com.gh.personinfo.job.service.imp;

import com.gh.personinfo.job.dao.JobDao;
import com.gh.personinfo.job.model.Job;
import com.gh.personinfo.job.service.JobService;
import com.gh.personinfo.project.dao.ProjectDao;
import com.gh.personinfo.project.model.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.enterprise.event.Observes;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class JobServiceImp implements JobService {
    @Autowired
    JobDao jobDao;

    @Autowired
    ProjectDao projectDao;

    @Override
    public List<Job> queryJobById(int proid) {
        Map<String,Integer> map = new HashMap<>();
        map.put("proid",proid);
        return jobDao.find(map);
    }

    @Override
    public void addJob(Job job) {
        System.out.println(job);
        jobDao.insert(job);
        updateProReq(job.getProid());
    }

    @Override
    public void updateJobById(Job job) {
        System.out.println(job);
        jobDao.update(job);
        updateProReq(job.getProid());
    }

    @Override
    public void deleteJobById(Job job) {
        System.out.println(job);
        jobDao.deleteById(job.getId());
        updateProReq(job.getProid());
    }


    public void updateProReq(int proId){
        Project project = projectDao.get(proId);
        Map<String,Object> promap = new HashMap<String, Object>();
        promap.put("proid",project.getId());
        List<Job> jobs = jobDao.find(promap);
        System.out.println(jobs);
        int sum=0;//预计人数
        for (Job job:jobs) {
            if(job.getReqnum()>0){
                sum+=job.getReqnum();//将每个项目的需求人数相加
            }
        }
        System.out.println(sum);
        project.setReqnum(sum);
        projectDao.update(project);
    }
}
