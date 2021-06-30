package com.cdkshop.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

// 从库存中售出（删除）CDK
public class KeyConsumer {
	// 返回实际删除
	static public int consume(List<String> list_cdk, Connection connect) throws SQLException {
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
}
