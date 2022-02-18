package com.xjm.service;

import com.xjm.domain.User;

import javax.servlet.http.HttpSession;

public interface LoginService {
    //登录
    public User login(User user);
}
