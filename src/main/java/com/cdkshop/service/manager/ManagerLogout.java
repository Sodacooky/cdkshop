package com.cdkshop.service.manager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ManagerLogout") public class ManagerLogout extends HttpServlet {
		@Override protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
				req.getSession().removeAttribute("logined");
				req.setAttribute("message", "您已退出登录");
				req.getRequestDispatcher("ManagerLogin.jsp").forward(req, resp);
		}
}
