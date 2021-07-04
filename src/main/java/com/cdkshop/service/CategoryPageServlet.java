package com.cdkshop.service;

import com.cdkshop.entity.Game;
import com.cdkshop.service.db.GameDataController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet("/CategoryPageServlet") public class CategoryPageServlet extends HttpServlet {
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				//get param
				Connection con = (Connection) req.getServletContext().getAttribute("connect");
				Map<String, String[]> param = req.getParameterMap();
				String category_name = "未分类";
				if (param.containsKey("category")) {
						category_name = param.get("category")[0];
				} else {
						req.getRequestDispatcher("Error.jsp").forward(req, resp);
				}
				int now_page = 1;
				if (param.containsKey("page")) {
						now_page = Integer.parseInt(param.get("page")[0]);
				}

				//query
				List<Game> list_game = null;
				int page_amount = 0;
				try {
						page_amount = GameDataController.searchListPageAmount(category_name, "category", con);
						if (page_amount > 0) {
								list_game = GameDataController.searchGetList(category_name, "category", now_page - 1, con);
						}
				} catch (SQLException e) {
						e.printStackTrace();
				}

				//store
				req.setAttribute("list_game", list_game);
				req.setAttribute("now_page", (Integer) now_page);
				req.setAttribute("page_amount", (Integer) page_amount);
				req.setAttribute("now_category", category_name);
				//message
				req.setAttribute("message_title", "正在浏览分类 " + param.get("category")[0]);
				req.setAttribute("message_content", "共有" + page_amount + "页结果，当前浏览第" + now_page + "页");

				//forward
				req.getRequestDispatcher("CategoryPage.jsp").forward(req, resp);
		}
}
