package com.xjm.controller;

import com.xjm.domain.Course;
import com.xjm.domain.Student;
import com.xjm.domain.User;
import com.xjm.exception.SysException;
import com.xjm.service.CourseService;
import com.xjm.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseService courseService;

    //查课程和他的学生
    @RequestMapping("/testFindStudent")
    public String testFindStudent(Model model){
        List<Course> list = courseService.findStudent();
        model.addAttribute("list",list);
        return "showCouS";
    }

    //显示课程
    @RequestMapping("/selectCourse")
    private String selectCourse(Model model, HttpServletRequest request) {
            List<Course> list = courseService.findAll();
            model.addAttribute("courseList", list);
            HttpSession session = request.getSession();
            Object obj = session.getAttribute("user");
            model.addAttribute("user", obj);
            return "showCourse";
    }

    //添加课程
    @RequestMapping("/addCourse")
    private void addCourse(Course course,Model model,HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
        try {
            courseService.addCourse(course);
            List<Course> list = courseService.findAll();
        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("msg","添加数据有问题，请核对后再试");
            throw new SysException("添加数据有问题，请核对后再试");
        }
        response.sendRedirect(request.getContextPath()+"/course/selectCourse");
    }

    //删除课程
    @RequestMapping("/deleteCourse")
    public void delete(Integer id, Model model,HttpServletRequest request,
                         HttpServletResponse response) throws Exception {
        courseService.deleteCourse(id);
        List<Course> list = courseService.findAll();
        model.addAttribute("msg","删除成功");
        response.sendRedirect(request.getContextPath()+"/course/selectCourse");
    }

    //修改课程
    @RequestMapping("/editCourse")
    public void update(Course course,Model model,HttpServletRequest request,
                         HttpServletResponse response) throws Exception {
        try {
            courseService.editCourse(course);
            List<Course> list = courseService.findAll();
        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("msg","添加数据有问题，请核对后再试");
            throw new SysException("添加数据有问题，请核对后再试");
        }
        response.sendRedirect(request.getContextPath()+"/course/selectCourse");
    }

    //跳1
    @RequestMapping("/gotoAdd")
    private String gotoAdd(){
       return "addCourse";
    }

    //跳2
    @RequestMapping("/gotoEdit")
    public ModelAndView gotoEdit(Integer id) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("id",id);
        Course course1=courseService.findById(id);
        mv.addObject("name",course1.getName());
        mv.addObject("teacher",course1.getTeacher());
        mv.addObject("time",course1.getTime());
        mv.addObject("score",course1.getScore());
        mv.setViewName("/editCourse");
        return mv;
    }
    //跳3
    @RequestMapping("/gotoFile")
    private String gotoFile(){
        return "fileUD";
    }

}
