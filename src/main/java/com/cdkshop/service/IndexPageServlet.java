package com.cdkshop.service;

import com.cdkshop.entity.Game;
import com.cdkshop.service.db.IndexPageGameFetcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/IndexPageServlet") public class IndexPageServlet extends HttpServlet {
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				//fetch game
				Connection con = (Connection) req.getServletContext().getAttribute("connect");
				List<Game> list_game = IndexPageGameFetcher.fetch(con);
				//store game list
				req.setAttribute("list_game", list_game);
				//forward
				req.getRequestDispatcher("IndexPage.jsp").forward(req, resp);
		}
}
