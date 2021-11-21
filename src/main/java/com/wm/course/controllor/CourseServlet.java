package com.wm.course.controllor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/course.do")
public class CourseServlet extends HttpServlet {
    private static final String PREX="WEB-INF/jsp/admin";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String method=req.getParameter("method");
       if (method.equals("courseUI")){
           courseUI(req,resp);
       }
    }
    //返回课程管理页面
    private void courseUI(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(PREX+"/course.jsp").forward(req,resp);
    }



}
