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
		this.strId = result.getString("id");
		this.strName = result.getString("name");
		this.nPrice = result.getInt("price");
		this.strCategory = result.getString("category");
		this.strPicturePath = result.getString("pic_path");
	}

	public String strId;
	public String strName;
	public String strCategory;
	public int nPrice;
	public String strPicturePath;
}
