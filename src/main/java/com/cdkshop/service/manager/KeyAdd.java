package com.cdkshop.service.manager;

import com.cdkshop.service.db.GameDataController;
import com.cdkshop.service.db.KeyDataController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Map;

@WebServlet("/KeyAdd") public class KeyAdd extends HttpServlet {
		@Override protected void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
				//
				Connection con = (Connection) req.getServletContext().getAttribute("connect");
				req.setCharacterEncoding("utf-8");
				Map<String, String[]> param = req.getParameterMap();
				boolean success = true;
				//check game exist
				success = __checkGameExist(param.get("id")[0], con);
				if (!success) {
						req.setAttribute("success", false);
						req.setAttribute("message", "添加CDK失败，游戏不存在");
						req.getParameterMap().clear();
						req.getRequestDispatcher("Manager.jsp").forward(req, resp);
				}
				//read lines
				success = __addKeys(param.get("id")[0], param.get("cdk_list")[0], con);
				if (!success) {
						req.setAttribute("success", false);
						req.setAttribute("message", "添加CDK失败，数据库错误");
				} else {
						req.setAttribute("success", true);
						req.setAttribute("message", "添加CDK成功");
				}
				req.getRequestDispatcher("Manager.jsp").forward(req, resp);
		}

		private static boolean __checkGameExist(String game_id, Connection con) {
				boolean ret = false;
				try {
						if (GameDataController.isGameExist(game_id, con)) {
								ret = true;
						} else {
								ret = false;
						}
				} catch (SQLException e) {
						e.printStackTrace();
				}
				return ret;
		}

		private static boolean __addKeys(String game_id, String textarea_content, Connection con) {
				String[] lines = textarea_content.split("\\r?\\n");
				boolean ret = false;
				try {
						if (KeyDataController.add(Arrays.asList(lines), game_id, con) == lines.length) {
								ret = true;
						} else {
								ret = false;
						}
				} catch (SQLException throwables) {
						throwables.printStackTrace();
				}
				return ret;
		}

}
