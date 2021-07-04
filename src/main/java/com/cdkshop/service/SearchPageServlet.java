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

@WebServlet("/SearchPageServlet") public class SearchPageServlet extends HttpServlet {
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				//get param
				Connection con = (Connection) req.getServletContext().getAttribute("connect");
				req.setCharacterEncoding("utf-8");
				Map<String, String[]> param = req.getParameterMap();
				String search_content = "null";
				if (param.containsKey("search")) {
						search_content = param.get("search")[0];
				}
				int now_page = 1;
				if (param.containsKey("page")) {
						now_page = Integer.parseInt(param.get("page")[0]);
				}
				//query
				int page_amount = 0;
				List<Game> list_game = null;
				try {
						page_amount = GameDataController.searchListPageAmount(search_content, "name", con);
						list_game = GameDataController.searchGetList(search_content, "name", now_page - 1, con);
				} catch (SQLException e) {
						e.printStackTrace();
				}
				//store
				req.setAttribute("list_game", list_game);
				req.setAttribute("now_page", (Integer) now_page);
				req.setAttribute("page_amount", (Integer) page_amount);
				req.setAttribute("now_search", search_content);
				//message
				req.setAttribute("message_title", search_content + " 的搜索结果");
				req.setAttribute("message_content", "共有" + page_amount + "页结果，当前浏览第" + now_page + "页");
				//forward
				req.getRequestDispatcher("CategoryPage.jsp").forward(req, resp);
		}
}
