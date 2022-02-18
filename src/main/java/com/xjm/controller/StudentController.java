package com.xjm.controller;

import com.xjm.domain.Student;
import com.xjm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    //查学生和他的课程
    @RequestMapping("/testFindCourse")
    public String testFindCourse(Model model) throws Exception{
        List<Student> list = studentService.findCourse();
        model.addAttribute("list",list);
        return "showStuC";
    }
}
