package com.xjm.controller;

import com.xjm.domain.Course;
import com.xjm.domain.User;
import com.xjm.exception.SysException;
import com.xjm.service.CourseService;
import com.xjm.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.support.AbstractMultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginController{
    @Autowired
    private LoginService loginService;

    //登录页面初始化
    @RequestMapping("/toLogin")
    public String initLogin() {
        return "login";
    }

    //处理登录功能
    @RequestMapping("/login")
    public String login(User user, Model model, HttpSession session) throws Exception{
        User user1 = loginService.login(user);
            if (user1 != null) {
                //登录成功，将用户信息保存到session对象中
                session.setAttribute("user", user1);
                //重定向到主页面的跳转方法
                model.addAttribute("user",user1);
                return "welcome";
            }
            else{
            model.addAttribute("msg", "请重新输入正确的账号和密码");
            return "error";
            }
    }

    //跳转到主页面
    @RequestMapping("/index")
    public String toMain() {
        return "login";
    }

    @RequestMapping("/loginOut")
    public String loginOut(HttpServletRequest request){
        request.getSession().setAttribute("user",null);
        return "login";
    }

}
