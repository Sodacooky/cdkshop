package com.cdkshop.service.db;

import com.cdkshop.entity.Game;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GameDataController {
		// 精确匹配 (%?%)
		// page页，0为首页首4个结果
		// val设为%即可列出全部
		public static List<Game> searchGetList(String val, String col, int page, Connection con) throws SQLException {
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
						game.nStockAmount = KeyDataController.countAmount(game.strId, con);
						list_game.add(game);
				}
				//
				stm.close();
				return list_game;
		}


		// 指定id
		public static Game searchGetOne(String game_id, Connection connect) throws SQLException {
				// get result set
				PreparedStatement stm = connect.prepareStatement("select * from game_info where id=?;");
				stm.setString(1, game_id);
				ResultSet result = stm.executeQuery();
				// assign
				Game game = null;
				if (result.next()) {
						game = new Game();
						game.assignResult(result);
						game.nStockAmount = KeyDataController.countAmount(game.strId, connect);
				}
				// cleanup
				stm.close();
				// return
				return game;
		}

		//4结果为1页
		public static int searchListPageAmount(String val, String col, Connection con) throws SQLException {
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


		//添加新游戏
		public static boolean addGame(Game game_obj, Connection con) throws SQLException {
				//query
				String sql = "insert into game_info values(?,?,?,?,?);";
				PreparedStatement stm = con.prepareStatement(sql);
				stm.setString(1, game_obj.strId);
				stm.setString(2, game_obj.strName);
				stm.setInt(3, game_obj.nPrice);
				stm.setString(4, game_obj.strCategory);
				stm.setString(5, game_obj.strPicturePath);
				int affect_row = stm.executeUpdate();
				//check
				stm.close();
				return affect_row == 1;
		}

		//修改游戏
		public static boolean modifyGame(Game game_obj, Connection con) throws SQLException {
				//不存在不修改
				if (!isGameExist(game_obj.strId, con)) {
						return false;
				}
				//删掉原来的行
				if (!deleteGame(game_obj.strId, con)) {
						return false;
				}
				//添加新航
				if (!addGame(game_obj, con)) {
						return false;
				}
				return true;
		}

		//删除游戏
		public static boolean deleteGame(String game_id, Connection con) throws SQLException {
				String sql = "delete from game_info where id=?;";
				PreparedStatement stm = con.prepareStatement(sql);
				stm.setString(1, game_id);
				int affect_row = stm.executeUpdate();
				//check
				stm.close();
				return affect_row == 1;
		}

		public static boolean isGameExist(String game_id, Connection con) throws SQLException {
				//query
				String sql = "select count(*) from game_info where id=?;";
				PreparedStatement stm = con.prepareStatement(sql);
				stm.setString(1, game_id);
				ResultSet result = stm.executeQuery();
				//check
				boolean exist = false;
				if (result.next()) {
						if (result.getInt(1) > 0) {
								exist = true;
						}
				}
				//
				stm.close();
				return exist;
		}

		public static List<String> getAllGameId(Connection con) throws SQLException {
				List<String> list = new ArrayList<>();
				try {
						Statement stm = con.createStatement();
						ResultSet result = stm.executeQuery("select id from game_info;");
						while (result.next()) {
								list.add(result.getString("id"));
						}
				} catch (SQLException throwables) {
						throwables.printStackTrace();
				}
				return list;
		}
}
