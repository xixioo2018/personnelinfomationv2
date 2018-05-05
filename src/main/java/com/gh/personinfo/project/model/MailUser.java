package com.gh.personinfo.project.model;

public class MailUser {
	private String host;
	private String uname;
	private String pwd;
	private String from;
	private String subject;
	private String content;
	private String to;
	private String fileName;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}

	public MailUser(String host, String uname, String pwd, String from, String subject, String content, String to, String fileName) {
		this.host = host;
		this.uname = uname;
		this.pwd = pwd;
		this.from = from;
		this.subject = subject;
		this.content = content;
		this.to = to;
		this.fileName = fileName;
	}

	public MailUser() {
	}

	@Override
	public String toString() {
		return "MailUser{" +
				"host='" + host + '\'' +
				", uname='" + uname + '\'' +
				", pwd='" + pwd + '\'' +
				", from='" + from + '\'' +
				", subject='" + subject + '\'' +
				", content='" + content + '\'' +
				", to='" + to + '\'' +
				", fileName='" + fileName + '\'' +
				'}';
	}
}