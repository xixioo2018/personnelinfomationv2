package com.gh.personinfo.project.util;

import com.gh.personinfo.project.model.MailUser;
import org.junit.Test;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Properties;

public class Testmail {
    @Test
    public void Test1()throws IOException{
        MailUser mailUser = new MailUser();
        String to = "613327951@qq.com";
        String fileName = "E:\\ideaWork\\personnelinfomationv2\\out\\artifacts\\personnelinfomationv2_Web_exploded\\WEB-INF\\upload\\test.txt";
        Send(to,fileName);
    }
    public void Send(String to,String fileName) throws IOException {
        Properties props = new Properties();
        props.load(this.getClass().getClassLoader().getResourceAsStream("email_template.properties"));
        String host = props.getProperty("host");//获取服务器主机
        String uname = props.getProperty("uname");//获取用户名
        String pwd = props.getProperty("pwd");//获取密码
        String from = props.getProperty("from");//获取发件人
        //String to = "613327951@qq.com";//获取收件人
        String subject = props.getProperty("subject");
        //获取主题
        String content = props.getProperty("content");//获取邮件内容
        content = MessageFormat.format(content, "");//替换{0}
        MailUser mailUser = new MailUser(host, uname, pwd, from, subject, content,to,fileName);
        System.out.println(content);
        try {
            JavaMail.SetEmail(mailUser);
            System.out.println("发送成功");
        } catch (Exception e1) {
            System.out.println("发送失败");
            e1.printStackTrace();
        }
    }
}
