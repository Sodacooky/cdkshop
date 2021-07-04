package com.cdkshop.entity;

import com.cdkshop.service.db.GameSearcher;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

// 购物车对象
public class Cart {
		public Cart() {
				m_mapContent = new HashMap<>();
		}

		public void add(String game_id, int amount) {
				if (m_mapContent.containsKey(game_id)) {
						Integer new_amount = m_mapContent.get(game_id) + amount;
						m_mapContent.replace(game_id, new_amount);
				} else {
						m_mapContent.put(game_id, amount);
				}
		}

		public void remove(String game_id) {
				if (m_mapContent.containsKey(game_id)) {
						m_mapContent.remove(game_id);
				}
		}

		//此时查表将id转化为game对象
		public Map<Game, Integer> getGameList(Connection con) {
				Map<Game, Integer> game_list = new HashMap<>();
				for (Map.Entry<String, Integer> entry : m_mapContent.entrySet()) {
						try {
								Game game = GameSearcher.search(entry.getKey(), con);
								game_list.put(game, entry.getValue());
						} catch (SQLException throwables) {
								throwables.printStackTrace();
						}
				}
				return game_list;
		}
		
		//content
		//game_id -> amount
		private Map<String, Integer> m_mapContent;
}

