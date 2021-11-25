package com.wm.colloge.service.impl;

import com.wm.colloge.dao.CollogeDao;
import com.wm.colloge.dao.impl.CollogeDaoImpl;
import com.wm.colloge.entity.Colloge;
import com.wm.colloge.entity.CollogeParm;
import com.wm.colloge.service.CollogeService;


import java.util.List;

public class CollogeServiceImpl  implements CollogeService {
    //sevice层调用dao层
    CollogeDao collogeDao=new CollogeDaoImpl();
    @Override
    public void add(Colloge colloge) {
        collogeDao.add(colloge);
    }

    @Override
    public List<Colloge> list(CollogeParm parm) {
        return collogeDao.list(parm);
    }

    @Override
    public int getCount(CollogeParm parm) {

            return collogeDao.getCount(parm);

    }

    @Override
    public Colloge getById(int collogeId) {
        return collogeDao.getById(collogeId);
    }

    @Override
    public void updateById(Colloge colloge) {
        collogeDao.updateById(colloge);
    }

    @Override
    public void deleteById(int collogeId) {
        collogeDao.deldeteById(collogeId);
    }
}
