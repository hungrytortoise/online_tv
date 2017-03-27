package com.tianshi.service;

import com.tianshi.domain.Demond;
import com.tianshi.domain.ShowInfo;

import java.util.List;

/**
 * Created by hefg on 2017/3/13.
 */
public interface DemondService {
    List<Demond> getall();

    void deleteByPrimaryKey(String id);

    List<Demond> getallByid(String id);

    Demond selectByPrimaryKey(String id);

    void addDemond(Demond demond);
}
