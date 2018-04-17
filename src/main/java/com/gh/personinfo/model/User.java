package com.gh.personinfo.model;

public class User {
    private Integer id;
    private String username;
    private String password;
    private Integer level;
    private Integer status;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", level=" + level +
                ", status=" + status +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public Integer getLevel() {
        return level;
    }

    public Integer getStatus() {
        return status;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
