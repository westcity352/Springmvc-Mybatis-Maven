package com.xjm.service;

import com.xjm.domain.Course;
import com.xjm.domain.Student;

import java.util.List;

public interface CourseService {
    //查所有课程
    public List<Course> findAll();

    //添加课程
    public void addCourse(Course course);

    //删除课程
    public void deleteCourse(Integer id);

    //修改课程
    public void editCourse(Course course);

    //根据id查课程
    public Course findById(Integer id);

    //查课程和他的学生
    public List<Course> findStudent();
}
