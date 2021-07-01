package com.cdkshop.db;

import com.cdkshop.entity.Game;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

// 获取首页最新若干游戏
public class IndexPageGameFetcher {
    public static List<Game> fetch(Connection con) {
        List<Game> list_game = new ArrayList<Game>();
        try {
            // do query
            String sql = "select * from game_info order by id desc limit 0,8;";
            Statement stm = con.createStatement();
            ResultSet result = stm.executeQuery(sql);
            // assign
            while (result.next()) {
                Game game = new Game();
                game.assignResult(result);
                game.nAmount = KeyCounter.get(game.strId, con);
                list_game.add(game);
            }
            stm.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list_game;
    }
}
