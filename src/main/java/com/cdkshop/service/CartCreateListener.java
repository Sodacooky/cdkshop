package com.cdkshop.service;

import com.cdkshop.entity.Cart;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener public class CartCreateListener implements HttpSessionListener {
		public void sessionCreated(HttpSessionEvent se) {
				Cart cart = new Cart();
				se.getSession().setAttribute("cart", cart);
		}

		public void sessionDestroyed(HttpSessionEvent se) {
				se.getSession().removeAttribute("cart");
		}
}
