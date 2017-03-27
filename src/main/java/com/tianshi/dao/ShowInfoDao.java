package com.tianshi.dao;

import com.tianshi.domain.ShowInfo;

import java.util.List;

public interface ShowInfoDao {
    int deleteByPrimaryKey(String id);

    int insert(ShowInfo record);

    int insertSelective(ShowInfo record);

    ShowInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ShowInfo record);

    int updateByPrimaryKey(ShowInfo record);

    List<ShowInfo> getAllRes();
    List<ShowInfo> getAllByUserName (String username) ;
}