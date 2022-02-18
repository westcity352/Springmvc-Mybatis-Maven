package com.xjm.domain;

import java.util.List;

public class Course {
    private Integer Id;
    private String Name;
    private Integer Teacher;
    private String Time;
    private Integer Score;

    private List<Student> students;

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }

    @Override
    public String toString() {
        return "Course{" +
                "Id=" + Id +
                ", Name='" + Name + '\'' +
                ", Teacher=" + Teacher +
                ", Time='" + Time + '\'' +
                ", Score=" + Score +
                '}';
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public Integer getTeacher() {
        return Teacher;
    }

    public void setTeacher(Integer teacher) {
        Teacher = teacher;
    }

    public String getTime() {
        return Time;
    }

    public void setTime(String time) {
        Time = time;
    }

    public Integer getScore() {
        return Score;
    }

    public void setScore(Integer score) {
        Score = score;
    }
}
