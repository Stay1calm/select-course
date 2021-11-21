package com.wm.test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/test.do")
public class TestServlet extends HttpServlet {
    private static final String PREX="WEB-INF/jsp/admin";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method=request.getParameter("method");
        if (method.equals("box1UI"))
        {
            box1UI(request,response);
        }else if (method.equals("box2UI")){
            box2UI(request,response);
        }
    }

    private void box2UI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(PREX+"/box2.jsp").forward(request,response);
    }

    private void box1UI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(PREX+"/box1.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
