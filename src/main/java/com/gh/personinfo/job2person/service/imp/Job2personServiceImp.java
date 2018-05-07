package com.gh.personinfo.job2person.service.imp;

import com.gh.personinfo.job.dao.JobDao;
import com.gh.personinfo.job.model.Job;
import com.gh.personinfo.job2person.dao.Job2personDao;
import com.gh.personinfo.job2person.model.Job2person;
import com.gh.personinfo.job2person.service.Job2personService;
import com.gh.personinfo.project.dao.ProjectDao;
import com.gh.personinfo.project.model.Project;
import com.gh.personinfo.project.util.Testmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class Job2personServiceImp implements Job2personService {
    @Autowired
    Job2personDao job2personDao;
    @Autowired
    ProjectDao projectDao;
    @Autowired
    JobDao jobDao;

    @Override
    public List<Job2person> queryJob2personByJid(int id) {
        Map map=new HashMap();
        map.put("jobId", id);
        return job2personDao.find(map);
    }

    @Override
    public void updateJob2personById(Job2person job2person) {
        job2personDao.update(job2person);
        Job job = jobDao.get(job2person.getJobid());
        updatematchproject(job.getProid());

    }

    @Override
    public void insertJob2person(String to, String fileName, Job2person job2person) {
        Testmail testmail = new Testmail();
        try {
            testmail.Send(to,fileName);
            job2personDao.insert(job2person);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }




    /**
     * 计算方法
     * @param projectId
     */
    @Override
    public void updatematchproject(Integer projectId) {
        Project project = projectDao.get(projectId);
        Map<String,Object> promap = new HashMap<String, Object>();
        promap.put("proid",project.getId());
        List<Job> jobs = jobDao.find(promap);
        int sum = 0;
        for (Job job:
             jobs) {
            updatematchjob(job);
        }
        List<Job> newjobs = jobDao.find(promap);
        for (Job job: newjobs) {
            /*if(job.getNownum()<0){
                job.setNownum(0);
            }*/
            sum += job.getNownum();
        }
        System.out.println("project:"+sum);
        project.setNownum(sum);
        projectDao.update(project);
    }
    @Override
    public void updatematchjob(Job job) {
        Map<String,Object> jobmap = new HashMap<String, Object>();
        jobmap.put("jobId",job.getId());
        List<Job2person> job2people = job2personDao.find(jobmap);
        int sum2 = 0;
        for (Job2person job2person:
             job2people) {
            System.out.println(job2person.toString());
            if(job2person.getStatus()==34) {
                System.out.println("CNM");
                sum2++;
            }
        }
        job.setNownum(sum2);
        System.out.println("jobsum"+sum2);
        jobDao.update(job);
    }

}
