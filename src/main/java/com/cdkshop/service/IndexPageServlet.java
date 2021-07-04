package com.cdkshop.service;

import com.cdkshop.entity.Game;
import com.cdkshop.service.db.KeyCounter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/IndexPageServlet") public class IndexPageServlet extends HttpServlet {
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				//fetch game
				Connection con = (Connection) req.getServletContext().getAttribute("connect");
				List<Game> list_game = new ArrayList<Game>();
				try {
						// do query
						String sql = "select * from game_info order by id desc limit 0,4;";
						Statement stm = con.createStatement();
						ResultSet result = stm.executeQuery(sql);
						// assign
						while (result.next()) {
								Game game = new Game();
								game.assignResult(result);
								game.nAmount = KeyCounter.get(game.strId, con);
								list_game.add(game);
						}
						stm.close();
				} catch (SQLException e) {
						e.printStackTrace();
				}
				//store game list
				req.setAttribute("list_game", list_game);
				//forward
				req.getRequestDispatcher("IndexPage.jsp").forward(req, resp);
		}
}
