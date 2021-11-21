package com.wm.setcourse.controllor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/setCourse.do")
public class SetCourseServlet extends HttpServlet {
    private static final String PREX="WEB-INF/jsp/admin";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String method=req.getParameter("method");
       if (method.equals("setCourseUI")){
           SetCourseUI(req,resp);
       }
    }
    //返回学院管理页面
    private void SetCourseUI(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(PREX+"/setCourse.jsp").forward(req,resp);
    }
}
