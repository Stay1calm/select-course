package com.wm.teachear.controllor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/teacher.do")
public class TeacherServlet extends HttpServlet {
    private static final String PREX="WEB-INF/jsp/admin";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String method=req.getParameter("method");
       if (method.equals("teacherUI")){
           teacherUI(req,resp);
       }
    }
    //返回学生管理页面
    private void teacherUI(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(PREX+"/teacher.jsp").forward(req,resp);
    }
}
