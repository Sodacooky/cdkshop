package com.cdkshop.service.manager;

import com.cdkshop.service.db.GameDataController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

@WebServlet("/GameDelete") public class GameDelete extends HttpServlet {
		@Override protected void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
				//
				Connection con = (Connection) req.getServletContext().getAttribute("connect");
				req.setCharacterEncoding("utf-8");
				Map<String, String[]> param = req.getParameterMap();
				//check game exist
				boolean success = false;
				try {
						if (GameDataController.isGameExist(param.get("id")[0], con)) {
								success = GameDataController.deleteGame(param.get("id")[0], con);
						}
				} catch (SQLException throwables) {
						throwables.printStackTrace();
				}
				//set message
				req.setAttribute("success", success);
				if (success) {
						req.setAttribute("message", "游戏删除成功");
				} else {
						req.setAttribute("message", "游戏删除失败");
				}
				//back
				req.getRequestDispatcher("Manager.jsp").forward(req, resp);
		}
}
