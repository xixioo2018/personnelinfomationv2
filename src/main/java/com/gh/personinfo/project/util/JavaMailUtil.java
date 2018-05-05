package com.gh.personinfo.project.util;

import com.gh.personinfo.project.model.MailUser;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class JavaMailUtil {

    public void Send(MailUser mailUser) throws MessagingException, GeneralSecurityException, UnsupportedEncodingException {
        Properties props = new Properties();

        // 开启debug调试
        props.setProperty("mail.debug", "true");
        // 发送服务器需要身份验证
        props.setProperty("mail.smtp.auth", "true");
        // 设置邮件服务器主机名
        props.setProperty("mail.host", "smtp.163.com");
        // 发送邮件协议名称
        props.setProperty("mail.transport.protocol", "smtp");

        Session session = Session.getInstance(props);

        Message msg = new MimeMessage(session);
        msg.setSubject(mailUser.getSubject());
        StringBuilder builder = new StringBuilder();
        builder.append("url = " + "http://blog.csdn.net/never_cxb/article/details/50524571");
        builder.append("\n页面爬虫错误");
        builder.append("\n时间 2016 ");
        msg.setText(mailUser.getContent());
        msg.setFrom(new InternetAddress(mailUser.getUname()));

        Multipart multipart = new MimeMultipart();

        // 添加邮件正文
        BodyPart contentBodyPart = new MimeBodyPart();
        // 邮件内容
        String result = "Hello World!";
        contentBodyPart.setContent(result, "text/html;charset=UTF-8");
        multipart.addBodyPart(contentBodyPart);

        BodyPart attachmentBodyPart = new MimeBodyPart();
        // 根据附件路径获取文件,
        FileDataSource dataSource = new FileDataSource(mailUser.getFileName());
        attachmentBodyPart.setDataHandler(new DataHandler(dataSource));
        //MimeUtility.encodeWord可以避免文件名乱码
        attachmentBodyPart.setFileName(MimeUtility.encodeWord(dataSource.getFile().getName()));
        multipart.addBodyPart(attachmentBodyPart);
        System.out.println("邮件发送成功");

        msg.setContent(multipart);
        Transport transport = session.getTransport();
        transport.connect(mailUser.getHost(), mailUser.getUname(), mailUser.getPwd());

        transport.sendMessage(msg, new Address[] { new InternetAddress(mailUser.getTo()) });
        transport.close();
    }

}