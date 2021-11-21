package com.wm.major.controllor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/major.do")
public class MajorServlet extends HttpServlet {
    private static final String PREX="WEB-INF/jsp/admin";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String method=req.getParameter("method");
       if (method.equals("majorUI")){
           majorUI(req,resp);
       }
    }
    //返回学院管理页面
    private void majorUI(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(PREX+"/major.jsp").forward(req,resp);
    }
}
