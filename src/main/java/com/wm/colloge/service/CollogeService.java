package com.wm.colloge.service;

import com.wm.colloge.entity.Colloge;
import com.wm.colloge.entity.CollogeParm;

import java.util.List;

public interface CollogeService {
    void add(Colloge colloge);
    List<Colloge> list(CollogeParm parm);
    //查询总条数
    int getCount(CollogeParm parm);
    //根据id查询数据
    Colloge getById(int collogeId);
    //根据id更新数据
    void updateById(Colloge colloge);
    //根据ID删除
    void deleteById(int collogeId);
}
