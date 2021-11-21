package com.wm.colloge.dao;
import com.wm.colloge.entity.Colloge;
import com.wm.colloge.entity.CollogeParm;
import java.util.List;

public interface CollogeDao {
    //新增学院
    void add(Colloge colloge);
    //查询列表
    List<Colloge> list(CollogeParm parm);
    //查询总条数
    int getCount(CollogeParm parm);
}
