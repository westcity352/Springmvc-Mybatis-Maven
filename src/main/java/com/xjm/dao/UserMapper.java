package com.xjm.dao;

import com.xjm.domain.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

    //登录
    public User login(User user);
}
