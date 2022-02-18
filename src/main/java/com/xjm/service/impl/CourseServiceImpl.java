package com.xjm.service.impl;

import com.xjm.dao.CourseMapper;
import com.xjm.domain.Course;
import com.xjm.domain.Student;
import com.xjm.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("courseService")
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    //查所有课程
    public List<Course> findAll() {
        return courseMapper.findAll();
    }

    //添加课程
    public void addCourse(Course course) {
        courseMapper.addCourse(course);
    }

    //删除课程
    public void deleteCourse(Integer id) {
        courseMapper.deleteCourse(id);
    }

    //修改课程
    public void editCourse(Course course) {
        courseMapper.editCourse(course);
    }

    //根据id查课程
    public Course findById(Integer id) {
        return courseMapper.findById(id);
    }


    //查课程和他的学生
    public List<Course> findStudent() {
        return courseMapper.findStudent();
    }


}