package com.cdkshop.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

// 游戏基本信息对象
public class Game {
		public Game() {
				strId = "0000";
				strName = "null";
				strCategory = "null";
				nPrice = -1;
				strPicturePath = "null";
		}

		// 注入数据库查询结果
		public void assignResult(ResultSet result) throws SQLException {
				strId = result.getString("id");
				strName = result.getString("name");
				nPrice = result.getInt("price");
				strCategory = result.getString("category");
				strPicturePath = result.getString("pic_path");
				__makeShortName();
		}

		public String strId;
		public String strName;
		public String strCategory;
		public int nPrice;
		public String strPicturePath;

		public String strShortName;
		public int nStockAmount;

		private void __makeShortName() {
				StringBuilder sb = new StringBuilder();
				int real_length = 0;
				int index = 0;
				for (; index < strName.length() && real_length < 16; index++) {
						if ((int) strName.charAt(index) > 255) {
								real_length += 2;
						} else {
								real_length += 1;
						}
						sb.append(strName.charAt(index));
				}
				if (index < strName.length()) {
						sb.append("...");
				}
				strShortName = sb.toString();
		}
}
