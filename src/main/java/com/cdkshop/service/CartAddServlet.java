package com.cdkshop.service;

import com.cdkshop.entity.Cart;
import com.cdkshop.service.db.KeyDataController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

@WebServlet("/CartAddServlet") public class CartAddServlet extends HttpServlet {
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				Connection con = (Connection) req.getServletContext().getAttribute("connect");
				Map<String, String[]> param = req.getParameterMap();
				String to_buy_id = "null";
				if (param.containsKey("id")) {
						to_buy_id = param.get("id")[0];
				}
				int to_buy_amount = 0;
				if (param.containsKey("amount")) {
						to_buy_amount = Integer.parseInt(param.get("amount")[0]);
				}
				//check amount
				int exist_amount = 0;
				try {
						exist_amount = KeyDataController.countAmount(to_buy_id, con);
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
				req.getRequestDispatcher("CartAddResult.jsp").forward(req, resp);
		}
}
