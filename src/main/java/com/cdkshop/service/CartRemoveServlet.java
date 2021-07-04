package com.cdkshop.service;

import com.cdkshop.entity.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/CartRemoveServlet") public class CartRemoveServlet extends HttpServlet {
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				Map<String, String[]> param = req.getParameterMap();
				String to_remove_id = "null";
				if (param.containsKey("id")) {
						to_remove_id = param.get("id")[0];
				}
				Cart cart = (Cart) req.getSession().getAttribute("cart");
				cart.remove(to_remove_id);
				req.getRequestDispatcher("CartPageServlet").forward(req, resp);
		}
}
