package com.cdkshop.service.db;

import com.cdkshop.entity.Game;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// 依靠名字或分类查询游戏
// 返回他们的游戏ID
public class GameSearcher {
		// 精确匹配 (%?%)
		// page页，0为首页首4个结果
		// val设为%即可列出全部
		public static List<Game> search(String val, String col, int page, Connection con) throws SQLException {
				// do query
				String sql = "select * from game_info where " + col + " like ? order by id desc limit ?,4;";
				PreparedStatement stm = con.prepareStatement(sql);
				stm.setString(1, "%" + val + "%");
				stm.setInt(2, page * 4);
				ResultSet result = stm.executeQuery();
				// assign
				List<Game> list_game = new ArrayList<Game>();
				while (result.next()) {
						Game game = new Game();
						game.assignResult(result);
						game.nAmount = KeyCounter.get(game.strId, con);
						list_game.add(game);
				}
				//
				stm.close();
				return list_game;
		}

		public static int searchPageAmount(String val, String col, Connection con) throws SQLException {
				// do query
				String sql = "select count(id) from game_info where " + col + " like ?;";
				PreparedStatement stm = con.prepareStatement(sql);
				stm.setString(1, "%" + val + "%");
				ResultSet result = stm.executeQuery();
				int game_amount = 0;
				if (result.next()) {
						game_amount = result.getInt(1);
				}
				stm.close();

				int page_amount = 0;
				if (game_amount > 0) {
						page_amount = game_amount / 4;
						if (game_amount % 4 != 0) {
								page_amount++;
						}
				}
				return page_amount;
		}

		// 指定id
		public static Game search(String game_id, Connection connect) throws SQLException {
				// get result set
				PreparedStatement stm = connect.prepareStatement("select * from game_info where id=?;");
				stm.setString(1, game_id);
				ResultSet result = stm.executeQuery();
				// assign
				Game game = null;
				if (result.next()) {
						game = new Game();
						game.assignResult(result);
						game.nAmount = KeyCounter.get(game.strId, connect);
				}
				// cleanup
				stm.close();
				// return
				return game;
		}

}
