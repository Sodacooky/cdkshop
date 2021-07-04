package com.cdkshop.service.db;

import com.cdkshop.entity.Key;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class KeyDataController {
		// 返回实际删除
		public static int consume(List<String> list_cdk, Connection connect) throws SQLException {
				String query = "delete from stock where cdk=?;";
				PreparedStatement stm = connect.prepareStatement(query);
				int consumed = 0;
				for (String cdk : list_cdk) {
						stm.setString(1, cdk);
						consumed += stm.executeUpdate();
				}
				stm.close();
				return consumed;
		}

		//添加，返回成功数量
		public static int add(List<String> list_cdk, String belong_game_id, Connection con) throws SQLException {
				String sql = "insert into stock values(?,?);";
				PreparedStatement stm = con.prepareStatement(sql);
				int affected_row = 0;
				for (String cdk : list_cdk) {
						stm.setString(1, cdk);
						stm.setString(2, belong_game_id);
						if (stm.executeUpdate() == 1) {
								affected_row++;
						}
				}
				stm.close();
				return affected_row;
		}

		//数量
		public static int countAmount(String game_id, Connection con) throws SQLException {
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

		// index指为哪一个 [0,
		public static Key get(String game_id, int index, Connection con) throws SQLException {
				// do query
				PreparedStatement stm = con.prepareStatement("select * from stock where game_id=? limit ?,1;");
				stm.setString(1, game_id);
				stm.setInt(2, index);
				ResultSet result = stm.executeQuery();
				// assign
				Key key = null;
				if (result.next()) {
						key = new Key();
						key.assignResult(result);
				}
				//
				stm.close();
				return key;
		}
}
