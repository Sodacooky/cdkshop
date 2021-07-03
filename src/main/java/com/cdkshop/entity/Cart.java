package com.cdkshop.entity;

import java.util.HashMap;
import java.util.Map;

// 购物车对象
public class Cart {
		public Cart() {
				m_mapContent = new HashMap<>();
		}

		

		//content
		//game_id -> amount
		Map<String, Integer> m_mapContent;
}
