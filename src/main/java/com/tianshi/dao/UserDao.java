package com.tianshi.dao;


import com.tianshi.domain.User;

import java.util.List;

public interface UserDao {
    int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User getByUsername(String username);

    List<User> getAll();
}