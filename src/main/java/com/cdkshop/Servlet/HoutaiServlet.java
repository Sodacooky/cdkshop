package com.cdkshop.Servlet;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/HoutaiServlet")
public class HoutaiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password =request.getParameter("password");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out =response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html><body>");
        if(username.equals("A")&&password.equals("1")) {
            out.println("登录成功！欢迎来到Electricity后台！");
            RequestDispatcher dispatcher =request.getRequestDispatcher("manage.jsp");
            dispatcher.forward(request, response);
        }
        else{
            out.println("登录失败");
        }
        out.println("</body></html>");
    }
}
