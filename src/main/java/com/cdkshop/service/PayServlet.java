package com.cdkshop.service;

import com.cdkshop.entity.Cart;
import com.cdkshop.entity.Game;
import com.cdkshop.entity.Key;
import com.cdkshop.service.db.KeyDataController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.ReentrantLock;

@WebServlet("/PayServlet") public class PayServlet extends HttpServlet {
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				lock.lock();

				Connection con = (Connection) req.getServletContext().getAttribute("connect");
				Cart cart = (Cart) req.getSession().getAttribute("cart");
				Map<Game, Integer> game_list = cart.getGameList(con);
				//读取cdk
				// game_name -> cdk_array
				Map<String, List<String>> cdk_list = new HashMap<>();
				boolean success = true;
				for (Map.Entry<Game, Integer> entry : game_list.entrySet()) {
						//按游戏读取
						List<String> keys = __getKeys(entry.getKey().strId, entry.getValue(), con);
						if (keys == null) {
								//不成功立刻放弃并设置失败消息
								success = false;
								req.setAttribute("success", false);
								req.setAttribute("message", "购买失败，" + entry.getKey().strName + "的库存已经不足");
						} else {
								//成功则推入Map
								cdk_list.put(entry.getKey().strName, keys);
						}
				}
				//
				if (success) {
						//不成功立刻跳转
						//成功则把CDK从数据库中删除
						__consumeKeys(cdk_list, con);
						req.setAttribute("success", true);
						req.setAttribute("message", "购买完成！");
						req.setAttribute("cdk_list", cdk_list);
						cart.removeAll();
				}

				lock.unlock();

				req.getRequestDispatcher("PayResultPage.jsp").forward(req, resp);
		}

		private List<String> __getKeys(String game_id, int amount, Connection con) {
				List<String> keys = new ArrayList<>();
				boolean success = true;
				try {
						for (int i = 0; i != amount; i++) {
								Key tmp_key = null;
								tmp_key = KeyDataController.get(game_id, i, con);
								if (tmp_key == null) {
										success = false;
										break;
								} else {
										keys.add(tmp_key.strCDK);
								}
						}
				} catch (SQLException e) {
						e.printStackTrace();
				}
				if (success) {
						return keys;
				} else {
						return null;
				}
		}

		private void __consumeKeys(Map<String, List<String>> map, Connection con) {
				for (Map.Entry<String, List<String>> entry : map.entrySet()) {
						try {
								if (KeyDataController.consume(entry.getValue(), con) != entry.getValue().size()) {
										System.out.println("出现了非原子操作");
								}
						} catch (SQLException throwables) {
								throwables.printStackTrace();
						}
				}
		}

		//控制一次只能有一个用户在支付
		private static ReentrantLock lock = new ReentrantLock();
}
