package com.xjm.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SysExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request,
                                         HttpServletResponse response, Object handler, Exception ex) {
        //获取异常独享
            SysException e=null;
        if(ex instanceof SysException){
            e=(SysException) ex;
        }else {
            e=new SysException("系统错误，请稍后.");
        }
        //创建modelandview对象
            ModelAndView mv = new ModelAndView();
            mv.addObject("msg",e.getMessage());
            mv.setViewName("error");
        return mv;
    }

}

