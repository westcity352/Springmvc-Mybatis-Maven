package com.xjm.service.impl;

import com.xjm.dao.StudentMapper;
import com.xjm.domain.Student;
import com.xjm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("studentService")
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

//查学生和他的课程
    public List<Student> findCourse() {
        return studentMapper.findCourse();
    }
}
