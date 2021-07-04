package com.cdkshop.service.manager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/ManagerLogin") public class ManagerLogin extends HttpServlet {
		@Override protected void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
				Map<String, String[]> param = req.getParameterMap();
				if (!param.containsKey("username") || !param.containsKey("password")) {
						req.setAttribute("message", "非法访问");
						req.getRequestDispatcher("LoginAuth.jsp").forward(req, resp);
				}
				//简单鉴权
				String user = param.get("username")[0];
				String pw = param.get("password")[0];
				if (user.equals("admin") && pw.equals("admin")) {
						req.getSession().setAttribute("logined", "");
						req.getRequestDispatcher("Manager.jsp").forward(req, resp);
				} else {
						req.setAttribute("message", "用户或密码错误");
						req.getRequestDispatcher("LoginAuth.jsp").forward(req, resp);
				}
		}
}
