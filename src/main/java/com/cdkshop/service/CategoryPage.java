package com.cdkshop.service;

import com.cdkshop.entity.Game;
import com.cdkshop.service.db.GameSearcher;

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

@WebServlet("/CategoryPage") public class CategoryPage extends HttpServlet {
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				//get application param
				Connection con = (Connection) req.getServletContext().getAttribute("connect");

				//get url param map
				Map<String, String[]> param = req.getParameterMap();
				//get category name
				String category_name = "未分类";
				if (param.containsKey("category")) {
						category_name = param.get("category")[0];
				} else {
						req.getRequestDispatcher("Error.jsp").forward(req, resp);
				}
				//get goal page
				int page = 0;
				if (param.containsKey("page")) {
						page = Integer.parseInt(param.get("page")[0]);
				}

				//fetch game
				List<Game> list_game = null;
				int page_amount = 0;
				try {
						page_amount = GameSearcher.searchPageAmount(category_name, "category", con);
						if (page_amount > 0) {
								list_game = GameSearcher.search(category_name, "category", page, con);
						}
				} catch (SQLException e) {
						e.printStackTrace();
				}

				//store
				req.setAttribute("list_game", list_game);
				req.setAttribute("now_page", (Integer) page);
				req.setAttribute("page_amount", (Integer) page_amount);
				//message
				req.setAttribute("message_title", "正在浏览分类 " + param.get("category")[0]);
				req.setAttribute("message_content", "");

				//forward
				req.getRequestDispatcher("GameDisplay.jsp").forward(req, resp);
		}
}
