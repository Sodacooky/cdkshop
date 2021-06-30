package com.cdkshop.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.cdkshop.entity.Game;

// 依靠名字或分类查询游戏
// 返回他们的游戏ID
public class GameSearcher {
	// 精确匹配
	// page页，0为首页首8个结果
	// val设为%即可列出全部
	public static List<Game> search(String val, String col, int page, Connection con)
			throws SQLException {
		// do query
		PreparedStatement stm =
				con.prepareStatement("select * from game_info where ? like '%?%' limit ?,8;");
		stm.setString(1, col);
		stm.setString(2, val);
		stm.setInt(3, page * 8);
		ResultSet result = stm.executeQuery();
		// assign
		List<Game> list_game = new ArrayList<Game>();
		while (result.next()) {
			Game game = new Game();
			game.assignResult(result);
			list_game.add(game);
		}
		//
		stm.close();
		return list_game;
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
		}
		// cleanup
		stm.close();
		// return
		return game;
	}

}
