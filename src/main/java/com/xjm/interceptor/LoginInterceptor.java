package com.xjm.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

    public class LoginInterceptor implements HandlerInterceptor {
        @Override
        public boolean preHandle(HttpServletRequest request,
                                 HttpServletResponse response, Object handler) throws Exception {
            // 获取请求的URL
            String url = request.getRequestURI();
            //login.jsp或登录请求放行，不拦截
            //indexOf指定url路径的字符串下标，如果为-1为false
            if (url.indexOf("/login") >= 0  || url.indexOf("/toLogin") >= 0) {
                return true;
            }
            // 获取session
            HttpSession session = request.getSession();
            Object obj = session.getAttribute("user");
            if (obj != null) {
                return true;
            }
            //没有登录且不是登录页面，转发到登录页面，并给出提示错误信息
            request.setAttribute("msg", "还没登录，请先登录！");
            //重定向
            response.sendRedirect(request.getSession().getServletContext().getContextPath());
            return false;
        }
    }

