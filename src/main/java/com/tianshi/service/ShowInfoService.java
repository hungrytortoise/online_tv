package com.tianshi.service;

import com.tianshi.domain.ShowInfo;

import java.util.List;

/**
 * Created by Administrator on 2017/3/10 0010.
 */
public interface ShowInfoService {
    List<ShowInfo> getAll();

    ShowInfo selectByPrimaryKey(String id);

    void deleteByPrimaryKey(String id);

    List<ShowInfo> getAllByUsername(String username);

    void add(ShowInfo showInfo);
}
