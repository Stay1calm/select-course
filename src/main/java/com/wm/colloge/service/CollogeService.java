package com.wm.colloge.service;

import com.wm.colloge.entity.Colloge;
import com.wm.colloge.entity.CollogeParm;

import java.util.List;

public interface CollogeService {
    void add(Colloge colloge);
    List<Colloge> list(CollogeParm parm);
    //查询总条数
    int getCount(CollogeParm parm);
}
