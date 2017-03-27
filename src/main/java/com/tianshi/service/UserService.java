package com.tianshi.service;

import com.tianshi.domain.User;

import java.util.List;

/**
 * Created by Administrator on 2017/3/10 0010.
 */
public interface UserService {
    User selectByPrimaryKey(Integer id) ;

    User getByUsername(String username);
    Integer  checkLogin(String username,String password);

    Integer register(User user);

    List<User> getAll();

    void delete(String id);
}
