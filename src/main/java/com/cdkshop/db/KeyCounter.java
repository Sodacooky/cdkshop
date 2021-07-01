package com.cdkshop.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// 获取游戏库存数量
public class KeyCounter {
	public static int get(String game_id, Connection con) throws SQLException {
		// do query
		String sql = "select count(cdk) from stock where game_id=? group by game_id;";
		PreparedStatement stm = con.prepareStatement(sql);
		stm.setString(1, game_id);
		ResultSet result = stm.executeQuery();
		// assign
		int val = 0;
		if (result.next()) {
			val = result.getInt(1);
		}
		//
		stm.close();
		return val;
	}
}
