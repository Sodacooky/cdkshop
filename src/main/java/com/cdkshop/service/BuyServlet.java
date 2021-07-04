package com.cdkshop.service;

import com.cdkshop.entity.Cart;
import com.cdkshop.service.db.KeyCounter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/BuyServlet") public class BuyServlet extends HttpServlet {
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				String to_buy_id = req.getParameter("id");
				int to_buy_amount = Integer.parseInt(req.getParameter("amount"));
				Connection con = (Connection) req.getServletContext().getAttribute("connect");

				//check amount
				int exist_amount = 0;
				try {
						exist_amount = KeyCounter.get(to_buy_id, con);
				} catch (SQLException throwables) {
						throwables.printStackTrace();
				}
				if (to_buy_amount > exist_amount) {
						req.setAttribute("success", false);
						req.setAttribute("message", "购买数量超过当前库存，或游戏不存在");
				} else {
						//push to cart
						Cart cart = (Cart) req.getSession().getAttribute("cart");
						cart.add(to_buy_id, to_buy_amount);
						req.setAttribute("success", true);
						req.setAttribute("message", "加入购物车成功");
				}
				req.getRequestDispatcher("BuyResult.jsp").forward(req, resp);
		}
}
