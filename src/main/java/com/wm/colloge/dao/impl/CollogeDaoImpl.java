package com.wm.colloge.dao.impl;

import com.wm.colloge.dao.CollogeDao;
import com.wm.colloge.entity.Colloge;
import com.wm.colloge.entity.CollogeParm;
import com.wm.utils.JDBCUtils;
import jdk.nashorn.internal.ir.CallNode;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.commons.lang.StringUtils;

import java.sql.SQLException;
import java.util.List;


public class CollogeDaoImpl  implements CollogeDao {
    //操作数据库对象
    public QueryRunner query = new QueryRunner(JDBCUtils.getDataSource());
    //开启下划线->驼峰转化所用 colloge_id->collogeId
    BeanProcessor bean=new GenerousBeanProcessor();
    RowProcessor processor=new BasicRowProcessor(bean);

    @Override
    public void add(Colloge colloge) {
        //定义sql
        String sql="insert into colloge(colloge_name,order_num) values(?,?)";
        //定义handler
        BeanHandler<Colloge> handler = new BeanHandler<>(Colloge.class);
        //组装参数
        Object[] parms={
                colloge.getCollogeName(),
                colloge.getOrderNum()
        };
        try {
            query.insert(sql,handler,parms);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Colloge> list(CollogeParm parm) {
        //定义sql
        StringBuilder builder = new StringBuilder("select * from colloge ");
        //判断关键字是否存在
        if (StringUtils.isNotEmpty(parm.getCollogeName())) {
            builder.append(" where colloge_name like '%" + parm.getCollogeName() + "%'");
        }

        //排序
        builder.append(" order by order_num desc limit ?,?");
        String sql=builder.toString();
        //定义handler
        BeanListHandler handler = new BeanListHandler<>(Colloge.class,processor);
        //设置参数
        Object[] parms={
                (parm.getPage()-1)*parm.getLimit(),
                parm.getLimit()

        };
        try {
          return (List<Colloge>) query.query(sql,handler,parms);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public int getCount(CollogeParm parm) {
        //定义sql语句
        StringBuilder builder = new StringBuilder("select count(colloge_id) from colloge");
        //判断关键字是否存在
        if (StringUtils.isNotEmpty(parm.getCollogeName())) {
            builder.append(" where colloge_name like '%" + parm.getCollogeName() + "%'");
        }
        String sql = builder.toString();
        //定义handler
        ScalarHandler<Object> handler = new ScalarHandler<>();
        //执行查询
        try {
            return Integer.valueOf(this.query.query(sql,handler).toString());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return 0;
    }
}
