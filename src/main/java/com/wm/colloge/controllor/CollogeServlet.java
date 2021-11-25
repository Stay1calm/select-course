package com.wm.colloge.controllor;
import com.alibaba.fastjson.JSONObject;
import com.wm.colloge.entity.Colloge;
import com.wm.colloge.entity.CollogeParm;
import com.wm.colloge.entity.TableData;
import com.wm.colloge.service.CollogeService;
import com.wm.colloge.service.impl.CollogeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/colloge.do")
public class CollogeServlet  extends HttpServlet {
    CollogeService collogeService= new CollogeServiceImpl();
    private static final String PREX="WEB-INF/jsp/admin";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String method=req.getParameter("method");
       if (method.equals("collogeUI")){
           collogeUI(req,resp);
       }else if (method.equals("addUI"))
       {
           addUI(req,resp);
       }else if (method.equals("addSave"))
       {
           addSave(req,resp);
       }else if (method.equals("list"))
       {
           list(req,resp);
       }else if (method.equals("editUI"))
       {
           editUI(req,resp);
       }else if (method.equals("editSave")){
           editSave(req,resp);
       }else if (method.equals("delete"))
       {
           delete(req,resp);
       }
    }
    //  根据id删除
    private void delete(HttpServletRequest req, HttpServletResponse resp) {
        int collogeId = Integer.parseInt(req.getParameter("collogeId"));
        //调用service删除
        collogeService.deleteById(collogeId);
        //返回信息给前端
        JSONObject object = new JSONObject();
        object.put("code",200);
        object.put("msg","删除成功");
        resp.setContentType("application/json;charset=UTF-8");
        try {
            resp.getWriter().print(object.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void editUI(HttpServletRequest req, HttpServletResponse resp) {
        //编辑数据获取id
        int collogeId= Integer.parseInt(req.getParameter("collogeId"));
        //根据id查询要编辑的数据
        Colloge colloge = collogeService.getById(collogeId);
        //放到request对象
        req.setAttribute("colloge",colloge);
        //返回页面给前端
        try {
            req.getRequestDispatcher(PREX+"/colloge_edit.jsp").forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //查询数据列表
    private void list(HttpServletRequest req, HttpServletResponse resp) {
        //返回的数据格式
        TableData result = new TableData();
        //封装前端传递过来的参数
        String collogeName = req.getParameter("collogeName");
        Integer page = Integer.valueOf(req.getParameter("page"));
        Integer limit = Integer.valueOf(req.getParameter("limit"));
        CollogeParm parm = new CollogeParm();
        parm.setPage(page);
        parm.setLimit(limit);
        parm.setCollogeName(collogeName);
        //表格数据
        List<Colloge> list = collogeService.list(parm);
        //查询总条数
        int count = collogeService.getCount(parm);
        result.setCode(0);
        result.setCount(count);
        result.setData(list);
        result.setMsg("查询成功！");
        //返回JSON数据
        resp.setContentType("application/json;charset=UTF-8");

        try {
            PrintWriter writer = resp.getWriter();
            writer.print(JSONObject.toJSONString(result));
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    //返回学院管理页面
    private void collogeUI(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(PREX+"/colloge.jsp").forward(req,resp);
    }
    //新增学院页面
    private void addUI(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(PREX+"/colloge_add.jsp").forward(req,resp);
    }
    //新增学院保存
    private void addSave(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //构造携带对象的参数
        Colloge colloge=new Colloge();
        //获取前端的值
        String collogeName=req.getParameter("collogeName");
        Integer orderNum= Integer.valueOf(req.getParameter("orderNum"));
        //设置参数到colloge
        colloge.setCollogeName(collogeName);
        colloge.setOrderNum(orderNum);
        collogeService.add(colloge);
        //响应前端数据
        //返回JSON对象
        resp.setContentType("application/json;charset=UTF-8");
        JSONObject result = new JSONObject();
        result.put("code",200);
        result.put("msg","新增成功！");
        resp.getWriter().write(result.toJSONString());

    }
        //编辑保存
    private void editSave(HttpServletRequest req, HttpServletResponse resp) {
        //获取从前端传回来的参数
        int collogeId = Integer.valueOf(req.getParameter("collogeId"));
        String collogeName = req.getParameter("collogeName");
        int orderNum = Integer.valueOf(req.getParameter("orderNum"));
        //封装数据
        Colloge colloge = new Colloge();
        colloge.setCollogeId(collogeId);
        colloge.setCollogeName(collogeName);
        colloge.setOrderNum(orderNum);
        System.out.println(colloge);
        //调用sevice层
        collogeService.updateById(colloge);
        //返回前端

        JSONObject  result= new JSONObject();
        result.put("code",200);
        result.put("msg","修改成功");
        resp.setContentType("application/json;charset=UTF-8");
        try {
            resp.getWriter().print(result.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

}
