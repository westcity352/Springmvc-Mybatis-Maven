package com.xjm.service.impl;

import com.xjm.dao.UserMapper;
import com.xjm.domain.User;
import com.xjm.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserMapper userMapper;

    //登录
    public User login(User user){
        return userMapper.login(user);
    }

}
