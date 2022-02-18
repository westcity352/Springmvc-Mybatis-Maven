package com.xjm.service;

import com.xjm.domain.Student;
import java.util.List;

public interface StudentService {

    //查所有学生和他的课程
    public List<Student> findCourse();
}
