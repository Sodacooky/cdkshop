package com.cdkshop.service.manager;

import com.cdkshop.entity.Game;
import com.cdkshop.service.db.GameDataController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

@WebServlet("/GameInfoAddModify") public class GameInfoAddModify extends HttpServlet {
		@Override protected void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
				//
				Connection con = (Connection) req.getServletContext().getAttribute("connect");
				req.setCharacterEncoding("utf-8");
				Map<String, String[]> param = req.getParameterMap();
				//assign game
				Game tmpGame = new Game();
				tmpGame.strId = param.get("id")[0];
				tmpGame.strName = param.get("name")[0];
				tmpGame.strCategory = param.get("category")[0];
				tmpGame.nPrice = Integer.parseInt(param.get("price")[0]);
				tmpGame.strPicturePath = param.get("pic_path")[0];
				//check exist
				//add or modify
				boolean success = true;
				try {
						if (GameDataController.isGameExist(tmpGame.strId, con)) {
								success = GameDataController.modifyGame(tmpGame, con);
						} else {
								success = GameDataController.addGame(tmpGame, con);
						}
				} catch (SQLException e) {
						e.printStackTrace();
				}
				//set message
				req.setAttribute("success", success);
				if (success) {
						req.setAttribute("message", "游戏添加/修改成功");
				} else {
						req.setAttribute("message", "游戏添加/修改失败");
				}
				//back
				req.getRequestDispatcher("Manager.jsp").forward(req, resp);
		}
}
