package com.xjm.domain;

public class User {


    private String Id;
    private String Password;
    private String name;
    private int job;

    public String getId() {
        return Id;
    }

    public void setId(String id) {
        Id = id;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getJob() {
        return job;
    }

    public void setJob(int job) {
        this.job = job;
    }

    @Override
    public String toString() {
        return "User{" +
                "Id='" + Id + '\'' +
                ", Password='" + Password + '\'' +
                ", name='" + name + '\'' +
                ", job=" + job +
                '}';
    }
}
