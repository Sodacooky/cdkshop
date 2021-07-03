package com.cdkshop.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

// 激活码对象
public class Key {
		public Key() {
				strCDK = "null";
				strGameId = "null";
		}

		public void assignResult(ResultSet result) throws SQLException {
				strCDK = result.getString("cdk");
				strGameId = result.getString("game_id");
		}

		public String strCDK;
		public String strGameId;
}
