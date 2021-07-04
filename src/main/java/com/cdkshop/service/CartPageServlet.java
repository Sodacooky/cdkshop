package com.cdkshop.service;

import com.cdkshop.entity.Cart;
import com.cdkshop.entity.Game;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.Map;

@WebServlet("/CartPageServlet") public class CartPageServlet extends HttpServlet {
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				Cart cart = (Cart) req.getSession().getAttribute("cart");
				Map<Game, Integer> game_list = cart.getGameList((Connection) req.getServletContext().getAttribute("connect"));
				req.setAttribute("game_list", game_list);
				req.getRequestDispatcher("CartPage.jsp").forward(req, resp);
		}

		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				doGet(req, resp);
		}
}
