package com.cdkshop.service.db;

import com.cdkshop.entity.Key;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class KeySearcher {
		// index指为哪一个 [0,
		public static Key search(String game_id, int index, Connection con) throws SQLException {
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
