package com.tianshi.service.impl;

import com.tianshi.dao.ShowInfoDao;
import com.tianshi.domain.ShowInfo;
import com.tianshi.service.ShowInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/3/10 0010.
 */
@Service
public class ShowInfoServiceImpl implements ShowInfoService {
    @Resource
    private ShowInfoDao showInfoDao ;
    public List<ShowInfo> getAll() {
        return showInfoDao.getAllRes();
    }

    public ShowInfo selectByPrimaryKey(String id) {
        Integer id2 =null ;
        try{
            id2 =Integer.parseInt(id) ;
        }catch (Exception e){

        }

        return showInfoDao.selectByPrimaryKey(id2);
    }

    public void deleteByPrimaryKey(String id) {
        showInfoDao.deleteByPrimaryKey(id) ;
    }

    public List<ShowInfo> getAllByUsername(String username) {
        return showInfoDao.getAllByUserName(username);
    }

    public void add(ShowInfo showInfo) {
        showInfoDao.insert(showInfo) ;
    }
}
