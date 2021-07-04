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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/KeyGenerate") public class KeyGenerate extends HttpServlet {
		@Override protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
				Connection con = (Connection) req.getServletContext().getAttribute("connect");
				try {
						List<String> game_list = GameDataController.getAllGameId(con);
						for (String game_id : game_list) {
								List<String> cdk_list = new ArrayList<>();
								for (int i = 0; i != 10; i++) {
										cdk_list.add(__generateRandomKey());
								}
								KeyDataController.add(cdk_list, game_id, con);
						}
				} catch (SQLException throwables) {
						throwables.printStackTrace();
				}
				req.setAttribute("success", true);
				req.setAttribute("message", "已完成生成");
				req.getRequestDispatcher("Manager.jsp").forward(req, resp);
		}

		private String __generateRandomKey() {
				StringBuilder str = new StringBuilder();
				str.append("FAKE-CDK-");
				for (int i = 0; i != 16; i++) {
						str.append((char) ((int) 'A' + Math.random() * 26));
				}
				return str.toString();
		}
}
